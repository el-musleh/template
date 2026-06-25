# AGENTS.md — Project Instructions

> **Read this file before making any changes to the {{PROJECT_NAME}} project.**
>
> **New project?** Run `docs/ONBOARDING.md` first to customize the scaffold before the initial commit.

## Project Identity

- **Name**: {{PROJECT_NAME}}
- **Description**: {{PROJECT_DESCRIPTION}}
- **Tech Stack**: {{TECH_STACK}}

## Quick Reference

| File type | Where it goes | Root exceptions |
|-----------|---------------|-----------------|
| `.md` | `docs/` | `README.md`, `LICENSE`, `AGENTS.md` |
| `.py` | `src/` | None |
| `.ipynb` | `notebooks/` | None |
| Config (`.toml`, `.yaml`, `.ini`, `.sh`, `.cfg`, `.txt`) | Root | — |
| Tests (`.py`) | `tests/` | — |

## Import Convention

Always prefix imports with `src.`:

```python
from src.core.module import ExampleClass
from src.utils.helpers import some_function
```

Never use bare module imports like `from core.module import ExampleClass` — they will break.

## Key Directories

| Directory | Purpose |
|-----------|---------|
| `src/core/` | Core application logic |
| `src/api/` | API layer and external interfaces |
| `src/persistence/` | Database models and storage adapters |
| `src/utils/` | Shared utilities |
| `tests/` | Pytest test suite |
| `notebooks/` | All Jupyter notebooks |
| `docs/` | All documentation |
| `.claude/skills/` | Reusable AI workflows |
| `.claude/hooks/` | Automation checks |
| `.windsurf/workflows/` | IDE-specific workflows |
| `.github/workflows/` | CI/CD pipelines |
| `.vscode/` | VS Code settings and extensions |
| `tools/scripts/` | Helper scripts |
| `tools/prompts/` | Reusable prompts |
| `src/scaffold.py` | Module scaffolding helper (run `just scaffold <name>`) |
| `justfile` / `Makefile` | Task runner definitions |

## AI Agent Guardrails

1. **Structure First**: Always consult this file and `docs/architecture.md` before creating files.
2. **No Root Clutter**: Do not create `.md` or `.py` files in root unless explicitly allowed above.
3. **Use Skills**: For repeated tasks (code review, refactoring, releases), use `.claude/skills/`.
4. **Check Hooks**: Run `pre-commit run --all-files` or relevant `.claude/hooks/` before committing changes.
5. **Module Context**: Each `src/` submodule has its own `CLAUDE.md`. Read it before editing that module.
6. **Test Discipline**: Add or update tests before major implementation work. Never delete tests without explicit direction.

## Before You Finish

- [ ] No stray `.md` or `.py` files in root (except allowed)
- [ ] All imports use `src.` prefix
- [ ] Tests pass: `just test` or `python -m pytest tests/`
- [ ] Linting passes: `just lint` or `ruff check . && mypy src/`
- [ ] Relevant module `CLAUDE.md` files consulted
