#!/bin/bash

# Simple GitHub Release Creation Script for GwaniCLI
set -e

VERSION="v0.2.0"
RELEASE_TITLE="GwaniCLI v0.2.0 - Smart Arabic Display System"

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

RELEASE_NOTES="# GwaniCLI v0.2.0 - Smart Arabic Display System

A major update introducing intelligent Arabic text rendering with automatic terminal capability detection.

## 🆕 New Features
- **Smart Arabic Display**: Automatic terminal capability detection
- **Multiple Display Modes**: Unicode, transliteration, both, or auto
- **Universal Compatibility**: Works on any terminal without requiring font installation
- **Enhanced Transliteration**: Comprehensive Arabic-to-Latin character mapping
- **Font Recommendations**: Built-in terminal testing and font suggestions
- **Terminal Optimizations**: Platform-specific improvements for better rendering

## 🚀 Enhanced Commands
- **New global option**: \`--arabic-mode [auto|unicode|transliteration|both]\`
- **New command**: \`gwani fonts\` - Check terminal capabilities and get font recommendations
- **Improved display**: All commands now use smart Arabic formatting

## Installation
\`\`\`bash
pip install gwanicli==0.2.0
\`\`\`

## Quick Examples
\`\`\`bash
# Auto-detect best display mode
gwani random

# Show both Arabic and transliteration
gwani --arabic-mode both random

# Check your terminal capabilities
gwani fonts
\`\`\`

## Backward Compatibility
- All existing commands work unchanged
- JSON output preserved for API consumers
- No breaking changes introduced

## Links
- PyPI: https://pypi.org/project/gwanicli/
- Documentation: https://github.com/bhantsi/gwani-cli#readme

May this enhanced tool be beneficial for study and reflection. 🤲"

echo "Creating release..."
if gh release create "$VERSION" --title "$RELEASE_TITLE" --notes "$RELEASE_NOTES"; then
    echo "✅ Successfully created GitHub release!"
    echo "🔗 https://github.com/bhantsi/gwani-cli/releases/tag/$VERSION"
else
    echo "❌ Failed to create release"
    exit 1
fi
