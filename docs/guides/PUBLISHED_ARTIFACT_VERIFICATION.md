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
  | {name, version, "installation-source", "install-path", source, dist}
' vendor/composer/installed.json
installed=vendor/maatify/php-return-target
diff -qr "$work/expected" "$installed"
for file in composer.json README.md LICENSE CHANGELOG.md SECURITY.md \
  RETURN_TARGET_PACKAGE_REFERENCE.md docs/guides/USAGE_GUIDE.md \
  examples/basic_usage.php llms.txt; do
  test -f "$installed/$file"
done
test ! -e "$installed/vendor"
test ! -e "$installed/composer.lock"
```

Review the installed Composer metadata, README, CHANGELOG, SECURITY, LICENSE,
Package Reference, usage guide, and examples. Record the installation mode,
references, archive comparison, and any presentation differences. The Consumer
Verification Harness checks runtime behavior separately.

## Recorded result for v1.0.0-rc.2

- **Installation and identity — PASS.** On 2026-11-14, the exact Packagist
  version installed in a clean Composer project at
  `vendor/maatify/php-return-target`. Composer reported `installation-source=dist`.
  The dist was the [GitHub ZIP recorded by Composer](https://api.github.com/repos/Maatify/php-return-target/zipball/296475973a13f5a06459145aa1f1fa7209782df3).
  Both source and dist references matched the release tag at
  `296475973a13f5a06459145aa1f1fa7209782df3`.
- **Archive contents — PASS.** The installed tree matched the tagged Git
  archive. The required legal and consumer files were present, with no bundled
  vendor directory or Composer lockfile.
- **Release presentation — NOT PASS against the current standard.** README,
  CHANGELOG and SECURITY identify the correct RC and the install command pins
  it. The immutable README and SECURITY use unqualified publication wording,
  and the archive retains repository URLs from before the organization
  transfer. The checkout updates apply to future archives.
