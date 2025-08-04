"""
Basic tests for GwaniCLI functionality.
This is a minimal test suite to verify the core components work.
"""

import pytest
import tempfile
import os
from pathlib import Path
from unittest.mock import Mock, patch

from qwanicli.config import Config
from qwanicli.cache import Cache
from qwanicli.api_client import QuranApiClient, ApiError
from qwanicli.formatter import format_verse
from qwanicli.utils import validate_surah_number, validate_ayah_number


class TestConfig:
    """Test configuration management."""

    def test_config_creation(self):
        """Test that config can be created with defaults."""
        with tempfile.TemporaryDirectory() as temp_dir:
            config_path = Path(temp_dir) / "test_config.toml"
            config = Config(str(config_path))

            assert config.get('translation') == 'en.sahih'
            assert config.get('cache_ttl') == 86400

    def test_config_set_get(self):
        """Test setting and getting config values."""
        with tempfile.TemporaryDirectory() as temp_dir:
            config_path = Path(temp_dir) / "test_config.toml"
            config = Config(str(config_path))

            config.set('translation', 'en.sahih')
            assert config.get('translation') == 'en.sahih'


class TestCache:
    """Test caching functionality."""

    def test_cache_creation(self):
        """Test that cache can be created."""
        with tempfile.TemporaryDirectory() as temp_dir:
            cache = Cache(cache_dir=temp_dir)
            assert cache is not None

    def test_cache_set_get(self):
        """Test setting and getting cache values."""
        with tempfile.TemporaryDirectory() as temp_dir:
            cache = Cache(cache_dir=temp_dir, ttl=3600)

            test_data = {'test': 'data', 'number': 123}
            endpoint = '/test/endpoint'
            params = {'param1': 'value1'}

            # Set cache
            result = cache.set(endpoint, test_data, params)
            assert result is True

            # Get cache
            cached_data = cache.get(endpoint, params)
            assert cached_data == test_data


class TestApiClient:
    """Test API client functionality."""

    def test_client_creation(self):
        """Test that API client can be created."""
        client = QuranApiClient()
        assert client.base_url == "https://api.alquran.cloud/v1"

    def test_surah_validation(self):
        """Test surah number validation."""
        client = QuranApiClient()

        # Valid surah numbers
        assert client._resolve_surah_identifier(1) == 1
        assert client._resolve_surah_identifier(114) == 114

        # Invalid surah numbers
        with pytest.raises(ApiError):
            client._resolve_surah_identifier(0)

        with pytest.raises(ApiError):
            client._resolve_surah_identifier(115)


class TestFormatter:
    """Test formatting functionality."""

    def test_format_verse_json(self):
        """Test JSON formatting."""
        test_data = {
            'surah': {'englishName': 'Al-Fatiha', 'number': 1},
            'text': 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
            'translation': 'In the name of Allah, the Beneficent, the Merciful.',
            'numberInSurah': 1
        }

        result = format_verse(test_data, json_output=True)
        assert '"translation"' in result
        assert '"text"' in result

    def test_format_verse_console(self):
        """Test console formatting."""
        test_data = {
            'surah': {'englishName': 'Al-Fatiha', 'number': 1},
            'text': 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
            'translation': 'In the name of Allah, the Beneficent, the Merciful.',
            'numberInSurah': 1
        }

        result = format_verse(test_data, json_output=False)
        assert 'Al-Fatiha' in result
        # Arabic text is reshaped/reordered, so check for Arabic unicode range instead
        arabic_present = any('\u0600' <= char <= '\u06FF' or '\uFB50' <=
                             char <= '\uFDFF' or '\uFE70' <= char <= '\uFEFF' for char in result)
        assert arabic_present, "Arabic text should be present in some form"
        assert 'In the name of Allah' in result


class TestUtils:
    """Test utility functions."""

    def test_validate_surah_number(self):
        """Test surah number validation."""
        assert validate_surah_number("1") is True
        assert validate_surah_number("114") is True
        assert validate_surah_number("0") is False
        assert validate_surah_number("115") is False
        assert validate_surah_number("Al-Fatiha") is True  # Name validation

    def test_validate_ayah_number(self):
        """Test ayah number validation."""
        assert validate_ayah_number(1) is True
        assert validate_ayah_number(286) is True
        assert validate_ayah_number(0) is False
        assert validate_ayah_number(-1) is False


if __name__ == "__main__":
    pytest.main([__file__])
