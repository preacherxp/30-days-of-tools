#!/bin/sh
# Renders every entry in thumbs.json with headless Chrome:
#   assets/thumbs/<slug>.png  800×600, the calendar tile (tight crop)
#   assets/heroes/<slug>.png  1600 wide, the README hero: the whole "hero" crop (x, y, w, h),
#                             framed with an even margin and rendered at 2×; hero.src picks
#                             a different source when the README needs one
# Usage: thumbs/make.sh [slug]   (everything when no slug is given)
set -eu
cd "$(dirname "$0")"
CHROME="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
PROFILE="$(mktemp -d)"
trap 'rm -rf "$PROFILE"' EXIT
mkdir -p ../assets/thumbs ../assets/heroes

render() { # out scale height query
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --allow-file-access-from-files \
    --user-data-dir="$PROFILE" --virtual-time-budget=3000 --window-size="800,$3" \
    --force-device-scale-factor="$2" --screenshot="$1" \
    "file://$PWD/template.html?$4" >/dev/null 2>&1
  echo "${1#../}"
}

jq -r '.[] | [.slug, .src, .x, .y, .w, (.hero.src // .src), (.hero.x // ""), (.hero.y // ""), (.hero.w // ""), (.hero.h // "")] | @tsv' thumbs.json |
while IFS="$(printf '\t')" read -r slug src x y w hsrc hx hy hw hh; do
  [ $# -gt 0 ] && [ "$1" != "$slug" ] && continue
  render "../assets/thumbs/$slug.png" 1 600 "src=$src&x=$x&y=$y&w=$w"
  if [ -n "$hw" ]; then
    height=$(( 96 + (704 * hh + hw / 2) / hw )) # two 48px margins plus the framed crop
    render "../assets/heroes/$slug.png" 2 "$height" "mode=hero&src=$hsrc&x=$hx&y=$hy&w=$hw&h=$hh"
  fi
done
