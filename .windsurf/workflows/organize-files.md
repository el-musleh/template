---
description: Organize new files into the correct project folders (docs, src, notebooks)
---

# Organize Files Workflow

Run this after creating new files to ensure they land in the right place.

## Steps

1. Identify file types:
   - `.md` -> `docs/` (except `README.md`, `LICENSE`, `AGENTS.md`)
   - `.py` -> `src/` (except `setup.py`)
   - `.ipynb` -> `notebooks/`
   - Config -> root
   - Tests -> `tests/`

2. Move misplaced files.

3. Update imports to use `src.` prefix.

4. Run `python -m pytest tests/` to verify.
