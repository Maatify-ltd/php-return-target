# Release Artifact Verification

Run from a Git checkout with Bash, Composer, PHP, and tar available:

```bash
bash scripts/ci/verify-release-artifact.sh <candidate-sha>
```

The command builds and extracts Git and Composer archives from the exact commit,
compares the full `src/` tree in each archive with the candidate checkout,
checks the other required files and target markers, and records the release target,
full SHA, and outcome. Quality runs the same command on the pull request head
or on the pushed commit with `published` as the second argument for checkout
documentation synchronized after publication. The default candidate mode
checks the undated heading and qualification wording on the release commit.
Use the actual candidate on `main` for release qualification.

Review the extracted README, CHANGELOG, SECURITY, LICENSE, Composer manifest, and
consumer documentation for the same SHA. For `1.0.0-rc.3`, check the exact
install target, publication facts scoped to qualification, the undated
CHANGELOG entry, and consistency with the PHP constraints and license. Record
that semantic review with the structural checks. Use
[Published Artifact Verification](PUBLISHED_ARTIFACT_VERIFICATION.md) for the
separate check through Packagist after publication.
