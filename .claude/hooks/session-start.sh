#!/bin/bash
set -euo pipefail

# Only run in remote (web) environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install Python dependencies for skills that have them
pip install -r "$CLAUDE_PROJECT_DIR/mcp-builder/scripts/requirements.txt"
pip install -r "$CLAUDE_PROJECT_DIR/slack-gif-creator/requirements.txt"

# Install Python packages commonly used by document-skills and other scripts
pip install pypdf reportlab python-pptx python-docx openpyxl playwright

# Install Playwright browsers for webapp-testing
playwright install --with-deps chromium

# Install ruff for Python linting
pip install ruff
