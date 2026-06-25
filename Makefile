# Makefile — Fallback task runner for {{PROJECT_NAME}}
# If you have `just` installed, use `just` instead (see justfile).

.PHONY: default test lint format check install-hooks run-hooks

default:
	@echo "Available targets: test, lint, format, check, install-hooks, run-hooks"
	@echo "Tip: Install 'just' (https://github.com/casey/just) for a nicer task runner."

test:
	python -m pytest tests/ -v
	python .claude/hooks/pre-commit-check.py

lint:
	ruff check .
	mypy src/

format:
	ruff check . --fix
	ruff format .

check: lint test

install-hooks:
	pre-commit install

run-hooks:
	pre-commit run --all-files
