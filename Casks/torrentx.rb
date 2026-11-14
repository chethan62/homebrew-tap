cask "torrentx" do
  version "18.10.0"
  sha256 "73c8e56a092971b83b64175a8495bbab19ba5417f20dabba564e8bd9fe39ca01"

  url "https://github.com/chethan62/torrentx/releases/download/v#{version}/TorrentX-#{version}-arm64-mac.dmg"
  name "TorrentX"
  desc "Search torrents through Jackett, with native sources and a player"
  homepage "https://github.com/chethan62/torrentx"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "TorrentX.app"
end
