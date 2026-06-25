---
description: Scaffold a new src/ module
---

# Scaffold Skill

## When to Use
When the user or an AI agent needs to create a new module under `src/`.

## Steps

1. **Do NOT manually create files.**
2. Run the scaffold CLI:
   ```bash
   python src/scaffold.py <module_name> [-d "description"]
   ```
3. The CLI auto-creates:
   - `src/<module>/__init__.py` — with boilerplate function
   - `src/<module>/CLAUDE.md` — module-specific instructions
   - `tests/test_<module>.py` — with correct `src.` import
4. **Verify** the module imports correctly:
   ```bash
   python -c "from src.<module> import example_function; print(example_function())"
   ```
5. Run tests to confirm:
   ```bash
   python -m pytest tests/test_<module>.py -v
   ```

## Why This Exists
Manual file creation leads to:
- Missing `__init__.py`
- Incorrect bare imports (`from module import X` instead of `from src.module import X`)
- Missing `CLAUDE.md` context for future AI agents

The scaffold CLI guarantees consistency.
