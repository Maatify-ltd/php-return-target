# Maatify Engineering Standards Adoption Manifest

## Adoption Record

- **Overall Resolution Status:** `VALID`
- **Adoption Model:** Selective pinned adoption
- **Upstream Repository:** `https://github.com/Maatify-ltd/php-engineering-standards.git`
- **Adoption Commit:** `d3dd98b8d82c8bcdd65614fe4ed80853bdcdcc73`
- **Adoption Date:** `2026-11-14`
- **Latest Applicability Re-evaluation:** `2026-11-14` against the exact Adoption Commit.
- **Additional Standards:** None
- **Explicit Exceptions/Overrides:** None

## Pinned Adoption Control Set

All files below are copied from the exact Adoption Commit recorded above.

- [Standards Adoption Standard](standards/STANDARDS_ADOPTION_STANDARD_AR.md) — `std-standards-adoption` `5.0.1`
- [Composer Package Profile](standards/profiles/COMPOSER_PACKAGE_PROFILE.md) — `composer-package` `4.0.0`
- [Repository Governance Profile](standards/profiles/REPOSITORY_GOVERNANCE_PROFILE.md) — `repository-governance` `3.0.0`

## Pinned Operational Assets Set

| Kind | Upstream Path | Local Path | SHA-256 |
|---|---|---|---|
| `skill` | `.agents/skills/maatify-standards-context-lifecycle/SKILL.md` | `.agents/skills/maatify-standards-context-lifecycle/SKILL.md` | `e86791d1d0e865610e4d77a557b3820624446ee0272cf03a49eee16aabba204b` |
| `skill` | `.agents/skills/maatify-strict-release-acceptance/SKILL.md` | `.agents/skills/maatify-strict-release-acceptance/SKILL.md` | `95ed8a461577bf8a55ce421111cf074edff5d7f0c98fa8893371366099a2839d` |
| `deterministic-helper` | `.agents/helpers/maatify-governance-context.php` | `.agents/helpers/maatify-governance-context.php` | `25852945a6d9fac44c8cfc55039b5a27e3aeb289e964c3e092b490e359ee5d59` |

## Active Profiles

### Activation 1: `composer-package`

- **Profile Version:** `4.0.0`
- **Scope:** `/`
- **Resolution Status:** `VALID`
- **Exception State:** `NONE`
- **Activation:** [Composer Package Profile](standards/profiles/COMPOSER_PACKAGE_PROFILE.md)

### Activation 2: `repository-governance`

- **Profile Version:** `3.0.0`
- **Scope:** `/`
- **Resolution Status:** `VALID`
- **Exception State:** `NONE`
- **Activation:** [Repository Governance Profile](standards/profiles/REPOSITORY_GOVERNANCE_PROFILE.md)

## Resolved Applicable Standards Set

These are the final Stage 2 applicable standards for the two activations at `/`, for this standalone stateless Composer package. Candidate standards excluded by their canonical applicability are not listed here.

| Standard ID | Version | Local path | Resolution provenance |
|---|---:|---|---|
| `std-package-building` | `4.0.0` | [PACKAGE_BUILDING_STANDARD.md](standards/packages/PACKAGE_BUILDING_STANDARD.md) | Direct requirement of `composer-package` at `/`; standalone Composer package |
| `std-composer-package` | `6.1.0` | [COMPOSER_PACKAGE_STANDARD.md](standards/packages/COMPOSER_PACKAGE_STANDARD.md) | Direct requirement of `composer-package` at `/`; repository is the standalone package root |
| `std-ci-workflow` | `6.0.0` | [CI_WORKFLOW_STANDARD.md](standards/packages/CI_WORKFLOW_STANDARD.md) | Direct requirement of `composer-package` at `/`; package CI scope |
| `std-library-presentation` | `6.0.0` | [LIBRARY_PRESENTATION_STANDARD.md](standards/packages/LIBRARY_PRESENTATION_STANDARD.md) | Direct requirement of `composer-package` at `/`; standalone reusable package presentation scope |
| `std-testing` | `3.0.0` | [TESTING_STANDARD.md](standards/testing/TESTING_STANDARD.md) | Direct requirement of `composer-package` at `/`; package testing scope |
| `std-php-source-documentation` | `1.0.0` | [PHP_SOURCE_DOCUMENTATION_STANDARD.md](standards/php/PHP_SOURCE_DOCUMENTATION_STANDARD.md) | Direct requirement of `composer-package` at `/`; the package owns manually maintained PHP source |
| `std-php-coding-style` | `1.0.1` | [PHP_CODING_STYLE_STANDARD.md](standards/php/PHP_CODING_STYLE_STANDARD.md) | Direct requirement of `composer-package` at `/`; the package owns manually maintained PHP code |
| `std-documentation-lifecycle` | `3.1.1` | [DOCUMENTATION_LIFECYCLE_STANDARD_AR.md](standards/governance/DOCUMENTATION_LIFECYCLE_STANDARD_AR.md) | Direct requirement of both active profiles; package owns durable documentation and repository governance records |
| `std-decision-governance` | `1.0.0` | [DECISION_GOVERNANCE_STANDARD_AR.md](standards/governance/DECISION_GOVERNANCE_STANDARD_AR.md) | Direct requirement of `repository-governance` at `/`; Maatify repository governance applies |
| `std-ai-collaboration-workflow` | `13.0.0` | [AI_COLLABORATION_WORKFLOW_AR.md](standards/ai/AI_COLLABORATION_WORKFLOW_AR.md) | Direct requirement of `repository-governance` at `/` |
| `std-github-phase-stack-workflow` | `5.0.0` | [GITHUB_PHASE_STACK_WORKFLOW_AR.md](standards/GITHUB_PHASE_STACK_WORKFLOW_AR.md) | Direct requirement of `repository-governance` at `/` |

## Resolution Summary

Both profiles apply at the standalone package root and neither extends another profile. The 12 unique candidates resolve to the 11 listed standards. External Provider Verification is excluded because the package owns no provider-specific contract. The package owns manually maintained PHP, tests and governance documentation. It owns no database, persistence layer or provider-specific contract. SQL/PDO and persistence clauses do not apply.

This upgrade replaces pin `73abc86359d9bd9b822f0aa355d06c1a16695724` with the exact approved upstream snapshot recorded above. No explicit additional standards or exceptions apply.
