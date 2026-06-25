# CLAUDE.md — src/persistence/

## Module Purpose
Persistence layer: database models, repositories, data access objects, and storage adapters.

## Guidelines
- Isolate storage concerns; never leak DB details to `src.core/` or `src.api/`.
- Use `src.utils/` for shared connection helpers or query builders.
- Define clear repository interfaces so storage can be swapped or mocked.
- Never import from sibling modules without `src.` prefix.
