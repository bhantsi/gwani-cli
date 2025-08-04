# Changelog

All notable changes to GwaniCLI will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2025-08-04

### Added
- **Core CLI Implementation**
  - Complete command-line interface with `random`, `surah`, `config`, and `version` commands
  - Support for multiple translation options (default: Saheeh International)
  - JSON output option for scripting and automation
  - Verbose logging mode for debugging

- **Arabic Text Processing**
  - Proper Arabic text reshaping using `arabic-reshaper`
  - Right-to-left (RTL) text ordering with `python-bidi`
  - Three display styles: simple, bordered, and highlighted
  - Terminal width-aware text wrapping
  - Unicode-safe text handling

- **Caching System**
  - SQLite-based caching with configurable TTL (Time To Live)
  - Automatic cache expiration and cleanup
  - Optimized for offline usage
  - Cache invalidation support

- **Configuration Management**
  - TOML-based configuration system
  - User-specific config directory support
  - Runtime configuration updates
  - Default settings with easy customization

- **API Integration**
  - Al-Quran Cloud API client
  - Comprehensive error handling with user-friendly messages
  - Network timeout and retry logic
  - Response validation and normalization

- **Development Features**
  - Comprehensive test suite with 10+ test cases
  - GitHub Actions CI/CD pipeline
  - Code quality tools (Black, Flake8, MyPy)
  - Professional project structure
  - Cross-platform compatibility (Linux, macOS, Windows)

- **Documentation**
  - Complete README with installation and usage instructions
  - Contributing guidelines for developers
  - Implementation status tracking
  - TODO roadmap for future features

### Technical Details
- **Dependencies**: Click, Requests, TOML, Arabic-Reshaper, Python-BIDI
- **Python Support**: 3.11+ (tested on 3.11 and 3.12)
- **License**: MIT License
- **Package Size**: ~376KB (excluding dependencies)

### Known Limitations
- Requires internet connection for first-time verse fetching
- Cache database grows over time (manual cleanup may be needed)
- Some terminal emulators may not fully support RTL text rendering

## [Unreleased]

### Planned Features
- [ ] Additional translation sources
- [ ] Bookmark system for favorite verses
- [ ] Search functionality within verses
- [ ] Audio recitation support
- [ ] Export options (PDF, HTML)
- [ ] Plugin system for extensions

---

**Note**: This is the initial release of GwaniCLI. Future releases will follow semantic versioning.
