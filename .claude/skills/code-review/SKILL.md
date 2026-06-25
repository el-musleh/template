---
description: Code review workflow
---

# Code Review Skill

## When to Use
Before submitting or merging code changes.

## Steps

1. **Read Context**
   - Check `AGENTS.md` for project structure rules.
   - Read the relevant module `CLAUDE.md` if it exists.

2. **Review Checklist**
   - [ ] Imports use `src.` prefix.
   - [ ] No stray `.md` or `.py` in root (except allowed).
   - [ ] Tests cover new/changed logic.
   - [ ] Functions have docstrings.
   - [ ] No hardcoded secrets.

3. **Run Checks**
   - Execute `python -m pytest tests/`.
   - Run `python .claude/hooks/pre-commit-check.py`.

4. **Feedback**
   - Provide inline comments on issues.
   - Suggest refactors only when they improve clarity or performance.
