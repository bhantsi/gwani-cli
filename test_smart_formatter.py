#!/usr/bin/env python3
"""
Test the new smart Arabic formatter functionality.
"""

from qwanicli.smart_formatter import SmartArabicFormatter
import sys
import os

# Add the project root to Python path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))


def test_smart_formatter():
    """Test the SmartArabicFormatter class."""
    print("🧪 Testing SmartArabicFormatter...")

    # Create formatter instance
    formatter = SmartArabicFormatter()

    # Test data
    test_verse = {
        'arabic_text': 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
        'translation': 'In the name of Allah, the Entirely Merciful, the Especially Merciful.',
        'surah': {
            'englishName': 'Al-Fatihah',
            'number': 1
        },
        'ayah_number': 1,
        'translator': 'Saheeh International'
    }

    print("\n📊 Terminal Capabilities:")
    capabilities = formatter.get_capabilities_info()
    print(
        f"  Arabic Support: {'✅ Yes' if capabilities['arabic_support'] else '❌ No'}")
    print(f"  Platform: {capabilities['terminal_info']['platform']}")
    print(f"  Encoding: {capabilities['terminal_info']['encoding']}")

    print("\n🔤 Testing Transliteration:")
    test_arabic = "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ"
    transliterated = formatter._transliterate_arabic(test_arabic)
    print(f"  Arabic: {test_arabic}")
    print(f"  Transliterated: {transliterated}")

    print("\n📝 Testing Verse Formatting:")
    print("  Unicode mode:")
    formatter.format_verse(test_verse, mode='unicode')

    print("  Transliteration mode:")
    formatter.format_verse(test_verse, mode='transliteration')

    print("✅ All SmartArabicFormatter tests completed!")


if __name__ == "__main__":
    test_smart_formatter()
