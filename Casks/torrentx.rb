cask "torrentx" do
  version "18.7.0"
  sha256 "2222222222222222222222222222222222222222222222222222222222222222"

  url "https://github.com/chethan62/torrentx/releases/download/v#{version}/TorrentX-#{version}-arm64-mac.dmg"
  name "TorrentX"
  desc "Search torrents through Jackett, with native sources and a player"
  homepage "https://github.com/chethan62/torrentx"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "TorrentX.app"
end
