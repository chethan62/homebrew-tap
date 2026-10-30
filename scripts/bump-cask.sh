#!/usr/bin/env bash
# Point Casks/torrentx.rb at the latest TorrentX release: version + the sha256 of
# the arm64 dmg that release actually serves. Idempotent — prints "up to date"
# and changes nothing when the cask already matches.
#
#   ./scripts/bump-cask.sh [path/to/cask]
#
# Needs curl; uses sha256sum when present (Linux runner) and shasum otherwise
# (macOS), because both exist in the places this runs.
set -euo pipefail

cask="${1:-Casks/torrentx.rb}"
repo="chethan62/torrentx"

[ -f "$cask" ] || { echo "no cask at $cask" >&2; exit 1; }

# The redirect, not api.github.com: unauthenticated API calls are rate-limited
# out from shared CI IPs.
ver=$(curl -sI "https://github.com/$repo/releases/latest" \
        | grep -i '^location:' | sed 's|.*/tag/v||' | tr -d '\r')
[ -n "$ver" ] || { echo "could not resolve the latest tag of $repo" >&2; exit 1; }

url="https://github.com/$repo/releases/download/v$ver/TorrentX-$ver-arm64-mac.dmg"
sha=$(curl -fsSL "$url" | { command -v sha256sum >/dev/null && sha256sum || shasum -a 256; } | cut -d' ' -f1)
[ -n "$sha" ] || { echo "could not hash $url" >&2; exit 1; }

cur_ver=$(sed -n 's/^  version "\(.*\)"$/\1/p' "$cask")
cur_sha=$(sed -n 's/^  sha256 "\(.*\)"$/\1/p' "$cask")

if [ "$cur_ver" = "$ver" ] && [ "$cur_sha" = "$sha" ]; then
  echo "up to date: $ver ${sha:0:12}…"
  exit 0
fi

sed -e "s/^  version \".*\"$/  version \"$ver\"/" \
    -e "s/^  sha256 \".*\"$/  sha256 \"$sha\"/" "$cask" > "$cask.tmp"
mv "$cask.tmp" "$cask"
echo "bumped ${cur_ver:-?} -> $ver (${sha:0:12}…)"
