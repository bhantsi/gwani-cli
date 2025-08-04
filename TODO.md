# Development Roadmap & TODO

## Project Status
✅ Complete scaffolding and architecture
⚠️  TODO: API implementation details
⚠️  TODO: Production testing

## Immediate Next Steps

### 1. API Client Implementation (`api_client.py`)
- [ ] Research actual Al-Quran Cloud API endpoints
- [ ] Implement proper random ayah fetching
- [ ] Add complete surah name to number mapping
- [ ] Handle edge cases (invalid surah/ayah numbers)
- [ ] Add retry logic for network errors
- [ ] Test with real API responses

### 2. Response Data Parsing (`formatter.py`)
- [ ] Analyze actual API response structure
- [ ] Update `_extract_verse_info()` function
- [ ] Test formatting with real API data
- [ ] Improve Arabic text rendering
- [ ] Add support for multiple ayahs display

### 3. Cache Integration (`cache.py`)
- [ ] Integrate CacheWrapper into CLI commands
- [ ] Test cache expiration logic
- [ ] Add cache size management
- [ ] Implement cache cleanup commands

### 4. Configuration Enhancements (`config.py`)
- [ ] Add more configuration options (colors, output format, etc.)
- [ ] Validate translation identifiers
- [ ] Add configuration migration support

### 5. Testing & Quality Assurance
- [ ] Expand test coverage
- [ ] Add integration tests with mock API
- [ ] Test installation process
- [ ] Test cross-platform compatibility
- [ ] Add GitHub Actions CI/CD

## API Integration Guide

### Al-Quran Cloud API Endpoints
Research and implement these endpoints:

1. **Random Ayah**: 
   - Endpoint: `/ayah/{edition}` (may need custom random logic)
   - Alternative: Generate random surah:ayah and fetch specific

2. **Specific Ayah**:
   - Endpoint: `/ayah/{reference}/{edition}`
   - Example: `/ayah/2:255/en.pickthall`

3. **Full Surah**:
   - Endpoint: `/surah/{number}/{edition}`
   - Example: `/surah/1/en.pickthall`

4. **Available Editions**:
   - Endpoint: `/edition`
   - Use for translation validation

### Response Structure Analysis
Study the actual API responses and update:
- `_extract_verse_info()` in `formatter.py`
- `get_random_ayah()` and `get_ayah_from_surah()` in `api_client.py`

## Feature Enhancements

### Short-term (v0.2.0)
- [ ] Search functionality (search within translations)
- [ ] Bookmarks/favorites system
- [ ] Multiple output formats (markdown, HTML)
- [ ] Improved error messages and help text

### Medium-term (v0.3.0)
- [ ] Multiple API sources support
- [ ] Audio recitation integration
- [ ] Interactive mode
- [ ] Surah information display (revelation place, period, etc.)

### Long-term (v1.0.0)
- [ ] Plugin system for custom translations
- [ ] GUI version
- [ ] Web interface
- [ ] Mobile app

## Code Quality Improvements

### Performance
- [ ] Add async/await support for API calls
- [ ] Implement connection pooling
- [ ] Optimize cache queries
- [ ] Add request rate limiting

### User Experience
- [ ] Better error messages
- [ ] Progress indicators for slow operations
- [ ] Autocomplete for surah names
- [ ] Smart suggestions for typos

### Developer Experience
- [ ] Add type hints everywhere
- [ ] Improve documentation
- [ ] Add more examples
- [ ] Create developer guide

## Installation Testing

Test the installation process:

```bash
# 1. Basic installation
pip install -e .

# 2. Development installation
pip install -e ".[dev]"

# 3. Test CLI availability
gwani --help

# 4. Test basic functionality
gwani version
gwani config get translation

# 5. Run tests
python test_basic.py
```

## Deployment Preparation

Before publishing to PyPI:
- [ ] Test installation on clean environments
- [ ] Update version numbers
- [ ] Write comprehensive changelog
- [ ] Add proper package metadata
- [ ] Create release notes

## Documentation Updates

- [ ] API documentation
- [ ] Installation troubleshooting
- [ ] Configuration reference
- [ ] Developer contribution guide
- [ ] Examples and tutorials

## Security Considerations

- [ ] Input validation for all user inputs
- [ ] Secure cache file permissions
- [ ] Safe handling of API keys (if needed)
- [ ] Audit dependencies for vulnerabilities

## Platform Compatibility

Test on:
- [ ] Linux (Ubuntu, CentOS, Arch)
- [ ] macOS
- [ ] Windows 10/11
- [ ] Python 3.11, 3.12, 3.13

## Performance Benchmarks

Create benchmarks for:
- [ ] API response times
- [ ] Cache hit/miss ratios
- [ ] Memory usage
- [ ] Startup time

---

## Getting Started Development Workflow

1. **Setup Environment**:
   ```bash
   cd /home/b_hantsi/Documents/gwani-cli
   python -m venv venv
   source venv/bin/activate
   pip install -e ".[dev]"
   ```

2. **Test Current State**:
   ```bash
   python example.py
   python test_basic.py
   ```

3. **Start with API Implementation**:
   - Test actual API endpoints manually
   - Update `api_client.py` with real implementations
   - Test with `gwani version` and `gwani config` commands

4. **Iterate and Test**:
   - Make changes
   - Run tests: `python test_basic.py`
   - Test CLI: `gwani --help`

The foundation is solid - you can start implementing the API calls and testing immediately!
