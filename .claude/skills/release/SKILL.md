---
description: Release workflow
---

# Release Skill

## When to Use
When preparing a new version for deployment.

## Steps

1. **Version Bump**
   - Update version in `setup.py`.
   - Tag the commit: `git tag -a vX.Y.Z -m "Release vX.Y.Z"`.

2. **Changelog**
   - Summarize changes since last release.
   - Add to `docs/runbooks/CHANGELOG.md` if it exists, or create it.

3. **Validation**
   - Run full test suite: `python -m pytest tests/`.
   - Run `python .claude/hooks/pre-commit-check.py`.
   - Check no stray files in root.

4. **Deploy**
   - Push tag: `git push origin vX.Y.Z`.
   - Follow deployment runbook in `docs/runbooks/`.
