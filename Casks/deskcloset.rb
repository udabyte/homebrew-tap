cask "deskcloset" do
  version "0.9.0-beta.10"
  sha256 "20743d7289f82ee5b0ec674db908bdb63c41630a6c7b11e237bbb28975cbd868"

  url "https://downloads.deskcloset.com/DeskCloset-#{version}.dmg"
  name "DeskCloset"
  desc "Files documents into folders, finds duplicates and tracks expiry dates"
  homepage "https://deskcloset.com/"

  livecheck do
    url "https://downloads.deskcloset.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "DeskCloset.app"
  binary "#{appdir}/DeskCloset.app/Contents/Resources/deskcloset"

  zap trash: [
    "~/Library/Application Support/DeskCloset",
    "~/Library/Preferences/com.udabyte.deskcloset.plist",
  ]
end
