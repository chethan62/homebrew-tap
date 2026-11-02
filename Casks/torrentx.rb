cask "torrentx" do
  version "18.9.1"
  sha256 "8bd1e4ed6b16d6c12c837eed112d10c1e7436382d2d91075ed8c7cbf24ca8d35"

  url "https://github.com/chethan62/torrentx/releases/download/v#{version}/TorrentX-#{version}-arm64-mac.dmg"
  name "TorrentX"
  desc "Search torrents through Jackett, with native sources and a player"
  homepage "https://github.com/chethan62/torrentx"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "TorrentX.app"
end
