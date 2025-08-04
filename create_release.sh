#!/bin/bash

# Simple GitHub Release Creation Script for GwaniCLI
set -e

VERSION="v0.1.0"
RELEASE_TITLE="GwaniCLI v0.1.0 - Initial Release"

echo "🚀 Creating GitHub Release for GwaniCLI"

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is not installed"
    echo "Install it from: https://cli.github.com/"
    exit 1
fi

# Check if logged in to GitHub
if ! gh auth status &> /dev/null; then
    echo "⚠️  Not logged in to GitHub. Please run: gh auth login"
    exit 1
fi

RELEASE_NOTES="# GwaniCLI v0.1.0 - Initial Release

A command-line interface for accessing Quranic verses and translations with elegant formatting and caching capabilities.

## Installation
\`\`\`bash
pip install gwanicli
\`\`\`

## Features
- Random verse retrieval with multiple translations
- Surah browsing by number or name
- Smart caching for offline access
- Beautiful Arabic text formatting
- JSON output for automation

## Links
- PyPI: https://pypi.org/project/gwanicli/
- Documentation: https://github.com/bhantsi/gwani-cli#readme

May this tool be beneficial for study and reflection. 🤲"

echo "Creating release..."
if gh release create "$VERSION" --title "$RELEASE_TITLE" --notes "$RELEASE_NOTES"; then
    echo "✅ Successfully created GitHub release!"
    echo "🔗 https://github.com/bhantsi/gwani-cli/releases/tag/$VERSION"
else
    echo "❌ Failed to create release"
    exit 1
fi
