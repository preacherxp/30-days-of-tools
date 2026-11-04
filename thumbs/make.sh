#!/bin/sh
# Renders every entry in thumbs.json with headless Chrome:
#   assets/thumbs/<slug>.png  800×600, the calendar tile (tight crop)
#   assets/heroes/<slug>.png  1600×1200, the README hero (the "hero" crop, rendered at 2×;
#                             hero.src picks a different source when the README needs one)
# Usage: thumbs/make.sh [slug]   (everything when no slug is given)
set -eu
cd "$(dirname "$0")"
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
PROFILE="$(mktemp -d)"
trap 'rm -rf "$PROFILE"' EXIT
mkdir -p ../assets/thumbs ../assets/heroes

render() { # out scale src x y w
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --allow-file-access-from-files \
    --user-data-dir="$PROFILE" --virtual-time-budget=3000 --window-size=800,600 \
    --force-device-scale-factor="$2" --screenshot="$1" \
    "file://$PWD/template.html?src=$3&x=$4&y=$5&w=$6" >/dev/null 2>&1
  echo "${1#../}"
}

jq -r '.[] | [.slug, .src, .x, .y, .w, (.hero.src // .src), (.hero.x // ""), (.hero.y // ""), (.hero.w // "")] | @tsv' thumbs.json |
while IFS="$(printf '\t')" read -r slug src x y w hsrc hx hy hw; do
  [ $# -gt 0 ] && [ "$1" != "$slug" ] && continue
  render "../assets/thumbs/$slug.png" 1 "$src" "$x" "$y" "$w"
  [ -n "$hw" ] && render "../assets/heroes/$slug.png" 2 "$hsrc" "$hx" "$hy" "$hw"
done
