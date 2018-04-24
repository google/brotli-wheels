# Brotli wheels

This repository is used to build and publish brotli "[wheels](https://pythonwheels.com/)" package.

[![Travis CI Status](https://travis-ci.org/google/brotli-wheels.svg?branch=master)](https://travis-ci.org/google/brotli-wheels)
[![Appveyor CI Status](https://ci.appveyor.com/api/projects/status/github/google/brotli-wheels?branch=master&svg=true)](https://ci.appveyor.com/project/szabadka/brotli-wheels)

## What are wheels?
Wheels are the new standard of Python distribution and are intended to replace eggs. 

## Advantages of wheels
 - Faster installation for pure Python and native C extension packages.
 - Avoids arbitrary code execution for installation. (Avoids setup.py)
 - Installation of a C extension does not require a compiler on Windows or macOS.
 - Allows better caching for testing and continuous integration.
 - Creates .pyc files as part of installation to ensure they match the Python interpreter used.
 - More consistent installs across platforms and machines.
