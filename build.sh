#!/usr/bin/env bash
set -euo pipefail

# Run from the directory where the script lives
cd "$(dirname "$0")"

echo "==> Cleaning output directory"
rm -rf _site
mkdir -p _site

echo "==> Rendering NL"
quarto render nl

echo "==> Rendering EN"
quarto render en

echo "==> Copying files from root/ to _site/"

if [ -d root ]; then
  cp -a root/. _site/
fi

echo "==> Done. Output is in ./_site/"
