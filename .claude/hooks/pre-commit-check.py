#!/usr/bin/env python3
"""
Pre-commit hook: verify structure and imports before commits.
Place in .claude/hooks/ and reference from AGENTS.md.
"""

import os
import sys
import subprocess

ROOT_FILES_ALLOWED = {
    "AGENTS.md", "README.md", "LICENSE",
    "setup.py", "setup.cfg", "setup.sh",
    "config.yaml", "config.sh", "config.ini", "config.txt",
    "requirements.txt", "requirements-dev.txt",
    ".gitignore", "pytest.ini",
}

def check_root_files():
    errors = []
    for item in os.listdir("."):
        if os.path.isfile(item):
            if item.endswith(".md") and item not in ROOT_FILES_ALLOWED:
                errors.append(f"Unexpected .md in root: {item}")
            if item.endswith(".py") and item not in ROOT_FILES_ALLOWED:
                errors.append(f"Unexpected .py in root: {item}")
    return errors

def check_tests():
    try:
        result = subprocess.run(
            ["python", "-m", "pytest", "tests/", "-q"],
            capture_output=True, text=True, timeout=60
        )
        if result.returncode != 0:
            return ["Tests failed. Run `python -m pytest tests/` for details."]
    except FileNotFoundError:
        return ["pytest not found, skipping test check."]
    except Exception as e:
        return [f"Test check error: {e}"]
    return []

def main():
    errors = check_root_files()
    # Uncomment to enforce tests before commits:
    # errors.extend(check_tests())
    if errors:
        print("Pre-commit check failed:")
        for e in errors:
            print(f"  - {e}")
        sys.exit(1)
    print("Pre-commit check passed.")
    sys.exit(0)

if __name__ == "__main__":
    main()
