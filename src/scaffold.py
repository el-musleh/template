#!/usr/bin/env python3
"""Scaffold a new src/ module with correct structure and boilerplate."""

import argparse
import sys
from pathlib import Path

MODULE_CLAUDE_MD = """# CLAUDE.md — src/{module}/

## Module Purpose
{description}

## Guidelines
- Keep functions focused and testable.
- Use `src.utils` for shared helpers.
- Never import from sibling modules without `src.` prefix.
"""


TEST_BOILERPLATE = """\"\"\"Tests for src.{module}.\"\"\"\n
from src.{module} import example_function


def test_example_function_exists():
    \"\"\"Smoke test for the module's public API.\"\"\"\n    assert callable(example_function)\n"""


INIT_BOILERPLATE = """\"\"\"{module} module.\"\"\"\n

def example_function() -> str:
    \"\"\"Return a greeting from the {module} module.\"\"\"\n    return "Hello from {module}!"
"""


def scaffold(module_name: str, description: str = "") -> None:
    """Create a new module with all required boilerplate."""
    root = Path(__file__).parent.parent
    module_dir = root / "src" / module_name
    test_file = root / "tests" / f"test_{module_name}.py"

    if module_dir.exists():
        print(f"Error: module '{module_name}' already exists at {module_dir}", file=sys.stderr)
        sys.exit(1)

    module_dir.mkdir(parents=True)
    (module_dir / "__init__.py").write_text(INIT_BOILERPLATE.format(module=module_name))
    (module_dir / "CLAUDE.md").write_text(
        MODULE_CLAUDE_MD.format(
            module=module_name,
            description=description or f"{module_name} module.",
        )
    )
    test_file.write_text(TEST_BOILERPLATE.format(module=module_name))

    print(f"Created module 'src.{module_name}'")
    print(f"  - {module_dir / '__init__.py'}")
    print(f"  - {module_dir / 'CLAUDE.md'}")
    print(f"  - {test_file}")


def main() -> None:
    """Run the scaffold CLI."""
    parser = argparse.ArgumentParser(description="Scaffold a new src/ module")
    parser.add_argument("module", help="Name of the new module (e.g. 'perception')")
    parser.add_argument("--description", "-d", default="", help="Short description for CLAUDE.md")
    args = parser.parse_args()
    scaffold(args.module, args.description)


if __name__ == "__main__":
    main()
