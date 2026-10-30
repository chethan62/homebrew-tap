cask "torrentx" do
  version "18.8.0"
  sha256 "a30dab0f71f8fac15e112aea5178bd4f63d70dd56399c317f324cbb3e79290c7"

  url "https://github.com/chethan62/torrentx/releases/download/v#{version}/TorrentX-#{version}-arm64-mac.dmg"
  name "TorrentX"
  desc "Search torrents through Jackett, with native sources and a player"
  homepage "https://github.com/chethan62/torrentx"

  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "TorrentX.app"
end
