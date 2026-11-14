# Changelog

All notable changes to this project will be documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and release entries use Semantic Versioning.

## [Unreleased]

## [1.0.0-rc.3] - 2026-11-15

### Changed

- Require PHP `>=8.4.27 <8.5.0 || >=8.5.12 <8.6.0`. Consumers on earlier patches must update PHP before installing this RC.
- Update repository URLs to Maatify-ltd and apply the free written proprietary authorization process under DEC-005.
- Demonstrate percent-encoded query spaces from a Composer consumer project.

## [1.0.0-rc.2] - 2026-10-02

### Changed

- Query-space boundary (`DEC-004`, superseding `DEC-003`; tracked in issue #21): a single-decoded U+0020 SPACE that originates from the query component, such as `/p?q=two%20words`, is now accepted. The exact original representation is still preserved by `issue()` and `verify()`, and a restriction policy still receives the single-decoded inspection form exactly once.

### Security

- The security contract is unchanged except for the point above: a raw SPACE anywhere and a decoded SPACE originating from the path (for example `/p%20x?q=1`) are still rejected, as are decoded NUL, CR/LF and other controls, DEL, backslash, `#`, and second-stage percent escapes in the query. A literal `+` is not decoded to SPACE. There is no new public API, configuration, token-format, crypto, or TTL change.

## [1.0.0-rc.1] - 2026-09-30

### Added

- Framework-agnostic stateless handling of internal return targets through the public `ReturnTargetServiceInterface` and canonical `HmacReturnTargetService`.
- Opaque, expiring `rt1` HMAC tokens with exact original-target preservation, current-policy revalidation during verification, and `VerifiedReturnTargetDTO` results.
- Canonical internal-target validation with an optional restrict-only Host policy, plus Host integration through `KeyProviderInterface` and `ClockInterface`.
- Typed configuration and classified crypto-configuration failure semantics, with normal target, token, policy, and expiry rejection kept separate from unexpected provider or Host-policy failures.
- Consumer Usage Guide, maintained runnable Public API example, external Consumer Verification Harness, and current Package Reference/README navigation.

### Security

- The canonical token is signed rather than encrypted and must not carry secrets or confidential data; HTTP, routing, authentication, authorization, persistence, key storage, and redirect execution remain Host-owned.

[Unreleased]: https://github.com/Maatify-ltd/php-return-target/compare/v1.0.0-rc.3...HEAD
[1.0.0-rc.3]: https://github.com/Maatify-ltd/php-return-target/releases/tag/v1.0.0-rc.3
[1.0.0-rc.2]: https://github.com/Maatify-ltd/php-return-target/releases/tag/v1.0.0-rc.2
[1.0.0-rc.1]: https://github.com/Maatify-ltd/php-return-target/releases/tag/v1.0.0-rc.1
