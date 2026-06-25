---
description: Refactoring workflow
---

# Refactor Skill

## When to Use
When restructuring code without changing behavior.

## Steps

1. **Baseline**
   - Ensure tests pass: `python -m pytest tests/`.
   - Read the relevant `CLAUDE.md`.

2. **Plan**
   - Identify the scope (function, module, or cross-module).
   - Document the reason in `docs/decisions/` if architectural.

3. **Execute**
   - Make minimal, focused changes.
   - Preserve `src.` import prefix.
   - Keep public APIs unchanged unless necessary.

4. **Verify**
   - Run tests again.
   - Run `python .claude/hooks/pre-commit-check.py`.

5. **Document**
   - Update docstrings if signatures changed.
   - Update `docs/architecture.md` if structure changed.
