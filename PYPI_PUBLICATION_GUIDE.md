# PyPI Publication Guide for GwaniCLI

## 🎉 Your package is ready for PyPI!

Your GwaniCLI package has been successfully built and tested. Follow these steps to complete the publication:

## Step 1: Create PyPI Account

1. Go to https://pypi.org/account/register/
2. Create an account with a secure password
3. Verify your email address

## Step 2: Enable Two-Factor Authentication

1. Go to https://pypi.org/manage/account/
2. Click "Add 2FA with authentication application"
3. Use an app like Google Authenticator or Authy
4. Save the recovery codes securely

## Step 3: Create an API Token

1. Go to https://pypi.org/manage/account/token/
2. Click "Add API token"
3. Give it a name like "GwaniCLI Upload"
4. Leave scope as "Entire account" (you can restrict it later)
5. Copy the token (starts with `pypi-`)

## Step 4: Upload to PyPI

Run this command in your project directory:

```bash
cd /home/b_hantsi/Documents/gwani-cli
source venv/bin/activate
twine upload dist/*
```

When prompted for username, enter: `__token__`
When prompted for password, paste your API token.

## Step 5: Verify Publication

After successful upload, your package will be available at:
- **Package page**: https://pypi.org/project/gwanicli/
- **Install command**: `pip install gwanicli`

## Package Information

- **Package Name**: gwanicli
- **Version**: 0.1.0
- **Author**: Hamza Danjaji (bhantsi@gmail.com)
- **License**: MIT
- **Python Support**: 3.11+

## Built Files Ready for Upload

Your `dist/` directory contains:
- `gwanicli-0.1.0-py3-none-any.whl` (wheel package)
- `gwanicli-0.1.0.tar.gz` (source distribution)

Both files have passed all validation checks and are ready for PyPI.

## Post-Publication Steps

### 1. Update README Badge
Add this badge to your README.md:
```markdown
[![PyPI version](https://badge.fury.io/py/gwanicli.svg)](https://badge.fury.io/py/gwanicli)
```

### 2. Test Installation
```bash
pip install gwanicli
gwani --help
```

### 3. Announce Your Package
- Share on social media
- Submit to Python Weekly
- Add to awesome-python lists
- Write a blog post

## Future Releases

For future versions:
1. Update version in `pyproject.toml` and `qwanicli/__init__.py`
2. Update `CHANGELOG.md`
3. Build and upload:
   ```bash
   python -m build
   twine upload dist/*
   ```

## Support

If you encounter issues:
- Check PyPI Help: https://pypi.org/help/
- Contact PyPI support if needed
- Check the packaging guide: https://packaging.python.org/

Your package is professionally prepared and ready for the Python community! 🚀

---

**Current Status**: ✅ Built and tested on TestPyPI
**Next Step**: Upload to PyPI with your API token
