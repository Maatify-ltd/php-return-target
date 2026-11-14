#!/usr/bin/env bash
set -euo pipefail

root="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --show-toplevel)"
target=1.0.0-rc.3
mode="${2:-candidate}"
case "$mode" in
    candidate|published) ;;
    *) printf 'Unknown archive verification mode: %s\n' "$mode" >&2; exit 1 ;;
esac
sha="$(git -C "$root" rev-parse --verify "${1:-HEAD}^{commit}")"
work="$(mktemp -d)"
finish() {
    local status=$?
    rm -rf "$work"
    printf '[release-artifact] target=%s sha=%s exit=%s\n' "$target" "$sha" "$status"
}
trap finish EXIT

git init --quiet "$work/source"
git -C "$work/source" fetch --quiet --no-tags --update-shallow "$root" "$sha"
git -C "$work/source" checkout --quiet --detach "$sha"
git -C "$work/source" archive --format=tar "$sha" > "$work/git.tar"
composer --no-plugins --no-scripts --working-dir="$work/source" archive --format=tar --dir="$work" --file=composer

for format in git composer; do
    artifact="$work/$format"
    mkdir "$artifact"
    tar -xf "$work/$format.tar" -C "$artifact"
    if ! diff -qr "$work/source/src" "$artifact/src"; then
        printf '%s archive runtime tree differs from candidate %s\n' "$format" "$sha" >&2
        exit 1
    fi
    for file in composer.json README.md CHANGELOG.md SECURITY.md LICENSE llms.txt \
        RETURN_TARGET_PACKAGE_REFERENCE.md docs/guides/USAGE_GUIDE.md examples/basic_usage.php; do
        test -f "$artifact/$file" || { echo "$format archive missing $file" >&2; exit 1; }
        cmp "$work/source/$file" "$artifact/$file"
    done
    unexpected="$(find "$artifact" \( -name vendor -o -name composer.lock -o -name .git \
        -o -name .idea -o -name .env -o -name '.env.*' -o -name auth.json -o -name '*.pem' -o -name '*.key' \) -print)"
    test -z "$unexpected" || { printf '%s archive has unexpected files:\n%s\n' "$format" "$unexpected" >&2; exit 1; }
    grep -Fx "composer require maatify/php-return-target:$target@RC" "$artifact/README.md"
    if [[ "$mode" == candidate ]]; then
        grep -Fx "## [$target]" "$artifact/CHANGELOG.md"
        grep -F "Release artifact target: \`$target\` (Release Candidate)." "$artifact/SECURITY.md"
    else
        grep -Fx "## [$target] - 2026-11-15" "$artifact/CHANGELOG.md"
        grep -F "[\`$target\` is the published Release Candidate on Packagist]" "$artifact/SECURITY.md"
    fi
    printf '[release-artifact] %s archive passed structural checks\n' "$format"
done
