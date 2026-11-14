# DEC-005 — No-charge written proprietary license

- **Decision ID:** `DEC-005`
- **Title:** No-charge written proprietary license
- **Status:** `ACTIVE`
- **Date:** `2026-11-14`
- **Decision Authority / Deciders:** Project Owner
- **Scope / Concern:** Copyright holder, licensor, and license administration
- **Supersedes:** `DEC-001`
- **Superseded By:** None
- **Canonical Contract / Current Owner:** [LICENSE](../../LICENSE), [README](../../README.md#license), [composer.json](../../composer.json)

## Context

[DEC-001](DEC-001-PROPRIETARY-LICENSE.md) selected proprietary licensing, and the
previous LICENSE required written authorization or a separate agreement. The
terms did not specify a free request process or how licensee contacts would be
used. The updated terms identify Maatify Ltd. as the rights holder and provide
a way to reach authorized consumers about security and critical updates.

## Decision

The Project Owner confirmed Maatify Ltd. as copyright holder and licensor and
approved the no-charge written authorization model. Consumers request a license
through the contact in LICENSE. Maatify Ltd. registers license holders and uses
their designated contact details for license administration, security advisories,
and critical update notices.

## Rationale and consequences

The written authorization process gives Maatify Ltd. a contact for reaching
authorized consumers about security and critical updates. Composer continues
to identify the package as `proprietary`. The updated terms apply to this
checkout and future releases that include it. Each published artifact retains
the license shipped with that version.
