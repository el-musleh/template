# CLAUDE.md — src/api/

## Module Purpose
API layer: HTTP endpoints, request/response schemas, routing, and external interface definitions.

## Guidelines
- Keep endpoints thin; delegate to `src.core/` for business logic.
- Use `src.utils/` for shared helpers (validation, serialization).
- Never import from sibling modules without `src.` prefix.
- Document every endpoint with docstrings.
