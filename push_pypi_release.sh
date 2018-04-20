#!/bin/bash
set -e

rm -rf dist || true
mkdir -p dist
curl -s https://api.github.com/repos/anthrotype/brotli-wheels/releases/latest | jq -r '.assets[].browser_download_url' | xargs wget -P dist/ -nv
twine upload dist/*
