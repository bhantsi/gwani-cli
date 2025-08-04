.PHONY: help install install-dev test lint format clean run-example

# Default target
help:
	@echo "GwaniCLI Development Commands"
	@echo ""
	@echo "Available targets:"
	@echo "  install      - Install the package"
	@echo "  install-dev  - Install in development mode with dev dependencies"
	@echo "  test         - Run tests"
	@echo "  lint         - Run linting checks"
	@echo "  format       - Format code with black"
	@echo "  clean        - Clean build artifacts"
	@echo "  run-example  - Run example commands"
	@echo "  help         - Show this help message"

# Installation
install:
	pip install .

install-dev:
	pip install -e ".[dev]"

# Testing
test:
	pytest test_basic.py -v

test-coverage:
	pytest test_basic.py --cov=qwanicli --cov-report=html --cov-report=term

# Code quality
lint:
	flake8 qwanicli/ --max-line-length=100 --extend-ignore=E203,W503
	mypy qwanicli/ --ignore-missing-imports

format:
	black qwanicli/ test_basic.py setup.py

format-check:
	black --check qwanicli/ test_basic.py setup.py

# Cleanup
clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	rm -rf .pytest_cache/
	rm -rf .coverage
	rm -rf htmlcov/
	find . -type d -name __pycache__ -delete
	find . -type f -name "*.pyc" -delete

# Example usage
run-example:
	@echo "Running GwaniCLI examples..."
	@echo "1. Showing version:"
	python -m qwanicli.cli version
	@echo ""
	@echo "2. Getting configuration:"
	python -m qwanicli.cli config get translation
	@echo ""
	@echo "3. Setting configuration:"
	python -m qwanicli.cli config set translation en.pickthall
	@echo ""
	@echo "Note: API commands require internet connection and may not work without proper API implementation"

# Build and distribution
build:
	python setup.py sdist bdist_wheel

upload-test:
	twine upload --repository testpypi dist/*

upload:
	twine upload dist/*

# Development setup
setup-dev:
	python -m venv venv
	@echo "Activate the virtual environment with:"
	@echo "  source venv/bin/activate  # On Linux/Mac"
	@echo "  venv\\Scripts\\activate     # On Windows"
	@echo "Then run: make install-dev"
