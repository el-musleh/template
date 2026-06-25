#!/usr/bin/env bash
set -euo pipefail

# new-project.sh — Scaffold a new project from this template
# Usage: ./new-project.sh <target_dir> [project_name] [description] [tech_stack]

TEMPLATE_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="${1:?Usage: $0 <target_dir> [project_name] [description] [tech_stack]}"
PROJECT_NAME="${2:-$(basename "$TARGET_DIR")}"
PROJECT_DESC="${3:-A new project based on the Claude Code template.}"
TECH_STACK="${4:-Python 3.x}"
YEAR=$(date +%Y)

# Copy template
mkdir -p "$TARGET_DIR"
cp -r "$TEMPLATE_DIR/AGENTS.md" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/README.md" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/LICENSE" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/.gitignore" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/pyproject.toml" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/requirements.txt" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/requirements-dev.txt" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/.pre-commit-config.yaml" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/.claude" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/.windsurf" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/.github" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/.vscode" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/docs" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/docs/ONBOARDING.md" "$TARGET_DIR/docs/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/src" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/tests" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/notebooks" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/tools" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/justfile" "$TARGET_DIR/" 2>/dev/null || true
cp -r "$TEMPLATE_DIR/Makefile" "$TARGET_DIR/" 2>/dev/null || true

# Substitute placeholders
substitute() {
    local file="$1"
    sed -i "s#{{PROJECT_NAME}}#$PROJECT_NAME#g" "$file"
    sed -i "s#{{PROJECT_DESCRIPTION}}#$PROJECT_DESC#g" "$file"
    sed -i "s#{{TECH_STACK}}#$TECH_STACK#g" "$file"
    sed -i "s#{{YEAR}}#$YEAR#g" "$file"
}

export PROJECT_NAME PROJECT_DESC TECH_STACK YEAR
export -f substitute

find "$TARGET_DIR" -type f \( \
    -name "*.md" -o -name "*.py" -o -name "*.json" -o -name "*.txt" -o -name "*.cfg" \
    -o -name "*.toml" -o -name "*.yaml" -o -name "*.yml" -o -name "*.sh" \
    -o -name "LICENSE" -o -name "justfile" -o -name "Makefile" \
\) -exec bash -c 'substitute "$0"' {} \;

# Remove this script from the new project (it belongs in the template)
rm -f "$TARGET_DIR/new-project.sh"

# Remove .gitkeep placeholders from empty dirs (optional)
find "$TARGET_DIR" -name ".gitkeep" -delete

# Init git
cd "$TARGET_DIR"
git init 2>/dev/null || true

echo "Created project '$PROJECT_NAME' in $TARGET_DIR"
echo "Next steps:"
echo "  cd $TARGET_DIR"
echo "  python -m venv .venv && source .venv/bin/activate"
echo "  pip install -r requirements.txt"
echo "  python -m pytest tests/"
