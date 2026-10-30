cask "torrentx" do
  version "18.9.0"
  sha256 "3b56a7d5ca114e92cff300f2b2169adaf4ac2b0f26b468b2ccb8e859f0e068e9"

  url "https://github.com/chethan62/torrentx/releases/download/v#{version}/TorrentX-#{version}-arm64-mac.dmg"
  name "TorrentX"
  desc "Search torrents through Jackett, with native sources and a player"
  homepage "https://github.com/chethan62/torrentx"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "TorrentX.app"
end
