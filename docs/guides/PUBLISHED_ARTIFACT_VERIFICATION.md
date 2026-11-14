# Published Artifact Verification

Run these commands from a checkout with the release tag, using Bash, a
supported PHP version, Composer, Git, jq, tar, and diff.

```bash
set -eu
ref=296475973a13f5a06459145aa1f1fa7209782df3
test "$(git rev-parse 'v1.0.0-rc.2^{commit}')" = "$ref"
work=$(mktemp -d)
mkdir "$work/expected" "$work/consumer"
git archive "$ref" > "$work/expected.tar"
tar -xf "$work/expected.tar" -C "$work/expected"
cd "$work/consumer"
printf '%s\n' '{"minimum-stability":"stable"}' > composer.json
export COMPOSER_HOME="$work/composer-home" COMPOSER_CACHE_DIR="$work/cache"
composer --no-plugins --no-scripts require maatify/php-return-target:1.0.0-rc.2@RC --prefer-dist --no-interaction
jq -e --arg ref "$ref" '
  .packages[] | select(.name == "maatify/php-return-target" and .version == "v1.0.0-rc.2")
  | select(."installation-source" == "dist" and .source.reference == $ref and .dist.reference == $ref)
  | {version, source, dist}
' vendor/composer/installed.json
diff -qr "$work/expected" vendor/maatify/php-return-target
```

Review the installed Composer metadata, README, CHANGELOG, SECURITY, LICENSE,
Package Reference, usage guide, and examples. Record the installation mode,
references, archive comparison, and any presentation differences. The Consumer
Verification Harness checks runtime behavior separately.

## Recorded result for v1.0.0-rc.2

The exact Packagist version installed via dist on 2026-11-14 and matched the
tagged Git archive at `296475973a13f5a06459145aa1f1fa7209782df3`. The published
archive retains repository URLs from before the organization transfer. The
updated URLs in the checkout apply to future archives.
