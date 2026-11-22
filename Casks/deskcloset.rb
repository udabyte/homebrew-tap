cask "deskcloset" do
  version "0.9.0-beta.8"
  sha256 "94e6e8254b22cfbb9441d4b35ed61584214ed04be5fa5a09ac5d110fff4c5891"

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
