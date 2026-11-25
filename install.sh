#!/bin/bash
# Installs the latest public release of Screenplay into /Applications.
#
#   curl -fsSL https://raw.githubusercontent.com/dhruv465/Screenplay/main/install.sh | bash
#
# It downloads only the published release ZIP from the public repository. It
# never contacts the private source repository and sends nothing about you.
set -euo pipefail

REPO="dhruv465/Screenplay"
ASSET="Screenplay-arm64.zip"
DEST="/Applications/Screenplay.app"

[ "$(uname -s)" = Darwin ] || { echo "Screenplay is a macOS app." >&2; exit 1; }
[ "$(uname -m)" = arm64 ] || { echo "Screenplay needs an Apple Silicon Mac." >&2; exit 1; }

echo "▸ finding the latest release"
url="$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" \
       | grep -o "https://[^\"]*/$ASSET" | head -n 1)"
[ -n "$url" ] || { echo "No $ASSET in the latest release of $REPO." >&2; exit 1; }

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
echo "▸ downloading $ASSET"
curl -fsSL "$url" -o "$tmp/$ASSET"

echo "▸ unpacking"
ditto -x -k "$tmp/$ASSET" "$tmp/app"
[ -d "$tmp/app/Screenplay.app" ] || { echo "The download did not contain Screenplay.app." >&2; exit 1; }

# Quit a running copy, or the replacement swaps the bundle under it.
osascript -e 'tell application "Screenplay" to quit' >/dev/null 2>&1 || true
sleep 1

echo "▸ installing to $DEST"
rm -rf "$DEST"
ditto "$tmp/app/Screenplay.app" "$DEST"
# Local builds are ad-hoc signed, so clear the quarantine flag the download added.
xattr -dr com.apple.quarantine "$DEST" 2>/dev/null || true

echo "✓ installed $("$DEST/Contents/MacOS/Screenplay" --version 2>/dev/null || echo Screenplay)"
open "$DEST"
