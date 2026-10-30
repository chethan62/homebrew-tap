# TorrentX Homebrew tap

```bash
brew install --cask chethan62/tap/torrentx
```

Apple silicon only (the release ships an arm64 `.dmg`), macOS 11+. A third-party tap needs trusting
once — Homebrew prompts, and `brew trust --cask chethan62/tap/torrentx` does the same in a script.

## What this installs

`Casks/torrentx.rb` points at the `.dmg` on the
[TorrentX releases page](https://github.com/chethan62/torrentx/releases/latest) and pins its
`sha256`. The app is ad-hoc signed, not notarised — Homebrew downloads it without the quarantine
attribute, so it launches without the Gatekeeper prompt a browser download produces.

## After a TorrentX release

Nothing to do. `bump.yml` runs hourly, reads the latest release, and if the cask's `version`/`sha256`
no longer match it commits the bump and then installs that cask on a macOS runner and checks the
installed app reports the pinned version. A stale cask therefore fails the tap's own CI, not a user's
`brew install`.

To do it by hand (or to test before pushing): `./scripts/bump-cask.sh` — idempotent, prints
`up to date: <version>` and changes nothing when the cask already matches.
