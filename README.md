# Brotli wheels

This repository is used to build and publish brotli "[wheels](https://pythonwheels.com/)" package.

![CI Status](https://github.com/google/brotli-wheels/actions/workflows/ci.yml/badge.svg)

## What are wheels?
Wheels are the new standard of Python distribution and are intended to replace eggs. 

## Advantages of wheels
 - Faster installation for pure Python and native C extension packages.
 - Avoids arbitrary code execution for installation. (Avoids setup.py)
 - Installation of a C extension does not require a compiler on Windows or macOS.
 - Allows better caching for testing and continuous integration.
 - Creates .pyc files as part of installation to ensure they match the Python interpreter used.
 - More consistent installs across platforms and machines.

## Updating to a new brotli version

This repository includes the [google/brotli](https://github.com/google/brotli) library as a git submodule at `src/brotli`. To build wheels for a new brotli release:

### 1. Update the submodule

```bash
cd src/brotli
git fetch origin
git checkout <TAG>  # e.g., v1.2.1
cd ../..
git add src/brotli
git commit -m "Update brotli submodule to <TAG>"
```

### 2. Push to trigger CI builds

```bash
git push
```

This will automatically trigger GitHub Actions to build wheels for:
- **Python versions**: 2.7 and 3.6 through 3.15
- **Linux**: x86_64, i686, aarch64, ppc64le (manylinux and musllinux)
- **macOS**: x86_64, ARM64 (universal2)
- **Windows**: x64, x86

The workflow also builds PyPy 3.11 and 3.12 wheels for Linux and macOS on x86_64 and ARM64, plus Windows x64.
PyPy 3.12 is a beta release.
The PyPy Linux wheels require glibc 2.28 or newer.

The workflow pins cibuildwheel 4.3.3 for Python 3.9 through 3.15, 2.23.3 for Python 3.6 through 3.8, and 1.12.0 for Python 2.7.
Python 2.7 Windows wheels use a separate MinGW build.
Python 2.7 and Python 3.6/3.7 macOS wheels support Intel Macs only.
Free-threaded Python wheels remain disabled for this release.

### 3. Publish to PyPI (for releases)

To publish the built wheels to PyPI:

1. Create a new GitHub release from the [Releases page](https://github.com/google/brotli-wheels/releases/new)
2. Tag the release (e.g., `v1.2.1`)
3. Publish the release

The GitHub Actions workflow will automatically upload all built wheels and the source distribution to PyPI when a release is published.
Tag pushes build the distributions but do not upload them to PyPI.
The upload uses the `PYPI_PASSWORD` repository secret as a PyPI API token, with `__token__` as the username.
