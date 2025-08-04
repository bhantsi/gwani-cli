# Contributing to GwaniCLI

Thank you for your interest in contributing to GwaniCLI! This guide will help you get started.

## Development Setup

### Prerequisites
- Python 3.11 or higher
- Git

### Setup Instructions

1. Fork and clone the repository:
```bash
git clone https://github.com/b-hantsi/gwani-cli.git
cd gwani-cli
```

2. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
pip install -e .
```

4. Install development dependencies:
```bash
pip install pytest flake8 black mypy
```

## Running Tests

```bash
# Run all tests
pytest test_basic.py -v

# Run with coverage
pytest test_basic.py --cov=qwanicli
```

## Code Quality

We maintain high code quality standards:

### Formatting
```bash
# Format code
black qwanicli/ test_*.py

# Check formatting
black --check qwanicli/ test_*.py
```

### Linting
```bash
# Basic linting
flake8 qwanicli --max-line-length=88

# Type checking
mypy qwanicli --ignore-missing-imports
```

## Project Structure

```
gwani-cli/
├── qwanicli/           # Main package
│   ├── __init__.py
│   ├── api_client.py   # API integration
│   ├── cache.py        # Caching system
│   ├── cli.py          # CLI interface
│   ├── config.py       # Configuration management
│   ├── formatter.py    # Text formatting
│   └── utils.py        # Utility functions
├── test_basic.py       # Test suite
├── requirements.txt    # Dependencies
├── setup.py           # Package configuration
└── README.md          # Documentation
```

## Contribution Guidelines

### Submitting Changes

1. Create a new branch for your feature:
```bash
git checkout -b feature/your-feature-name
```

2. Make your changes and test them:
```bash
pytest test_basic.py
black qwanicli/ test_*.py
flake8 qwanicli
```

3. Commit your changes:
```bash
git commit -m "Add: brief description of your changes"
```

4. Push and create a pull request:
```bash
git push origin feature/your-feature-name
```

### Commit Message Format

Use conventional commit messages:
- `Add:` for new features
- `Fix:` for bug fixes
- `Update:` for improvements
- `Remove:` for deletions
- `Docs:` for documentation

### Code Standards

- Follow PEP 8 style guidelines
- Use Black for code formatting (line length: 88)
- Write descriptive variable and function names
- Add docstrings for public functions
- Include type hints where appropriate

### Areas for Contribution

- **API Integration**: Improve error handling and add more endpoints
- **Arabic Text Processing**: Enhance formatting and display options
- **Caching**: Optimize cache performance and add more cache backends
- **Testing**: Expand test coverage and add integration tests
- **Documentation**: Improve user guides and API documentation
- **Features**: Add new CLI commands and options

### Bug Reports

When reporting bugs, please include:
- Python version
- Operating system
- Steps to reproduce
- Expected vs actual behavior
- Error messages (if any)

### Feature Requests

For feature requests, please describe:
- The problem you're trying to solve
- Your proposed solution
- Any alternative solutions considered
- Additional context or screenshots

## Development Tips

### Testing with Real API

```bash
# Test random verse
gwani random

# Test specific surah
gwani surah 1

# Test configuration
gwani config set translation en.sahih
gwani config get translation
```

### Debugging

Enable verbose logging:
```bash
gwani -v random
```

### Adding New Features

1. Update the relevant module (e.g., `cli.py` for new commands)
2. Add tests in `test_basic.py`
3. Update documentation
4. Test thoroughly

## Questions?

Feel free to open an issue for any questions about contributing!
