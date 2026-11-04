#!/bin/sh
# Renders every entry in thumbs.json to assets/thumbs/<slug>.png with headless Chrome.
# Usage: thumbs/make.sh [slug]   (all thumbnails when no slug is given)
set -eu
cd "$(dirname "$0")"
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
PROFILE="$(mktemp -d)"
trap 'rm -rf "$PROFILE"' EXIT
mkdir -p ../assets/thumbs

jq -r '.[] | [.slug, .src, .x, .y, .w] | @tsv' thumbs.json | while IFS="$(printf '\t')" read -r slug src x y w; do
  [ $# -gt 0 ] && [ "$1" != "$slug" ] && continue
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --allow-file-access-from-files \
    --user-data-dir="$PROFILE" --virtual-time-budget=3000 --window-size=800,600 \
    --screenshot="../assets/thumbs/$slug.png" \
    "file://$PWD/template.html?src=$src&x=$x&y=$y&w=$w" >/dev/null 2>&1
  echo "assets/thumbs/$slug.png"
done
