cask "torrentx" do
  version "18.9.2"
  sha256 "cc6ed0778c253a2eb9de3b19340d3c0e8e05e13eef513d86a7272c5bbe609a1f"

  url "https://github.com/chethan62/torrentx/releases/download/v#{version}/TorrentX-#{version}-arm64-mac.dmg"
  name "TorrentX"
  desc "Search torrents through Jackett, with native sources and a player"
  homepage "https://github.com/chethan62/torrentx"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "TorrentX.app"
end
