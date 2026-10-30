# TorrentX Homebrew tap

```bash
brew install --cask chethan62/tap/torrentx
```

Apple silicon only (the release ships an arm64 `.dmg`), macOS 11+.

## What this installs

`Casks/torrentx.rb` points at the `.dmg` on the
[TorrentX releases page](https://github.com/chethan62/torrentx/releases/latest) and pins its
`sha256`. The app is ad-hoc signed, not notarised — Homebrew downloads it without the quarantine
attribute, so it launches without the Gatekeeper prompt a browser download produces.

## After a TorrentX release

The cask pins a version and a hash, so both have to move together:

```bash
ver=18.8.0
sha=$(curl -sL "https://github.com/chethan62/torrentx/releases/download/v$ver/TorrentX-$ver-arm64-mac.dmg" | sha256sum | cut -d' ' -f1)
sed -i "s/^  version .*/  version \"$ver\"/; s/^  sha256 .*/  sha256 \"$sha\"/" Casks/torrentx.rb
```

`brew style Casks/torrentx.rb` locally, then push — the `cask` workflow taps this checkout on a
macOS runner, installs the cask and runs the installed `TorrentX --version`, so a stale hash fails
CI instead of a user's install.
