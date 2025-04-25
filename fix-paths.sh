#!/usr/bin/env bash
set -euo pipefail

# The subfolder where your HTTrack‐mirrored game lives:
ROOT="pokerogue.net"

# Find all .html, .css, .js files and rewrite absolute → relative paths
find . -type f \( -name '*.html' -o -name '*.css' -o -name '*.js' \) -print0 \
| xargs -0 sed -i \
    -e 's|="/assets/|="./'"$ROOT"'/assets/|g' \
    -e "s|='/assets/|='./$ROOT/assets/|g" \
    -e 's|url("/assets/|url("./'"$ROOT"'/assets/|g' \
    -e "s|url('/assets/|url('./$ROOT/assets/|g" \
    -e 's|="/fonts/|="./'"$ROOT"'/fonts/|g' \
    -e "s|='/fonts/|='./$ROOT/fonts/|g" \
    -e 's|url("/fonts/|url("./'"$ROOT"'/fonts/|g' \
    -e "s|url('/fonts/|url('./$ROOT/fonts/|g" \
    -e 's|="/logo512.png|="./'"$ROOT"'/logo512.png|g' \
    -e "s|='/logo512.png|='./$ROOT/logo512.png|g" \
    -e 's|="/manifest.webmanifest|="./'"$ROOT"'/manifest.webmanifest|g' \
    -e "s|='/manifest.webmanifest|='./$ROOT/manifest.webmanifest|g"

echo "✔️ Paths updated to ./$ROOT/…"
