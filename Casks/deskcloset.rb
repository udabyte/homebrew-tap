cask "deskcloset" do
  version "0.9.0-beta.9"
  sha256 "f6451864807cdd23728db64ec4bccfcc1ec377f9b44743b7bdedf62532b3e61b"

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
