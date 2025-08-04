#!/bin/bash
# GwaniCLI Setup Script
# This script sets up the development environment and tests the installation

set -e  # Exit on any error

echo "🌟 GwaniCLI Setup Script"
echo "========================"

# Check if we're in the right directory
if [ ! -f "setup.py" ]; then
    echo "❌ Error: Please run this script from the gwani-cli project directory"
    exit 1
fi

# Check Python version
echo "🐍 Checking Python version..."
python3 --version
if [ $? -ne 0 ]; then
    echo "❌ Error: Python 3 is required but not found"
    exit 1
fi

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
else
    echo "✅ Virtual environment already exists"
fi

# Activate virtual environment and install dependencies
echo "🔧 Installing dependencies..."
source venv/bin/activate
pip install --upgrade pip
pip install -e .

# Install development dependencies
echo "🛠️  Installing development dependencies..."
pip install pytest black flake8 mypy

# Run tests
echo "🧪 Running tests..."
python test_basic.py

# Test CLI functionality
echo "🎯 Testing CLI functionality..."
echo "   Testing version command..."
gwani version

echo "   Testing config command..."
gwani config get translation

echo "   Testing basic verse retrieval..."
gwani surah 1 --ayah 1

echo "✅ Setup complete!"
echo ""
echo "🚀 Quick start commands:"
echo "   source venv/bin/activate    # Activate virtual environment"
echo "   gwani --help               # Show help"
echo "   gwani version              # Show version"
echo "   gwani random               # Get random verse"
echo "   gwani surah 1 --ayah 1     # Get specific verse"
echo "   python demo.py             # Run full demonstration"
echo ""
echo "📖 Read README.md for detailed usage instructions"
