# DEC-006 — RC.3 PHP compatibility boundary

- **Decision ID:** `DEC-006`
- **Title:** RC.3 PHP compatibility boundary
- **Status:** `ACTIVE`
- **Date:** `2026-11-14`
- **Decision Authority / Deciders:** Project Owner
- **Scope / Concern:** PHP interpreter compatibility
- **Supersedes:** None
- **Superseded By:** None
- **Canonical Contract / Current Owner:** [composer.json](../../composer.json)

## Context

The published `1.0.0-rc.2` declares PHP `^8.4`. The CI interpreter floor
protects verification jobs, while Composer uses the package constraint to select
an installable release.

## Decision

The Project Owner approved `1.0.0-rc.3` as the compatibility boundary for
`>=8.4.27 <8.5.0 || >=8.5.12 <8.6.0`.

## Rationale and consequences

Use the supported security patch floors at dependency resolution time.
Composer consumers below either floor must upgrade PHP before installing
`rc.3`. CI checks the actual interpreter and verifies the manifest boundaries
using Composer Semver. The published `rc.2` retains its original constraint.
