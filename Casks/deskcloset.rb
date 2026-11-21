cask "deskcloset" do
  version "0.9.0-beta.7"
  sha256 "966f166e527e49e8b970cfb1ac8f61d6f50b19180241fd9b53783a9c5e946b1a"

  url "https://downloads.deskcloset.com/DeskCloset-#{version}.dmg"
  name "DeskCloset"
  desc "Files documents into folders, finds duplicates and tracks expiry dates"
  homepage "https://deskcloset.com/"

  livecheck do
    url "https://downloads.deskcloset.com/appcast.xml"
    strategy :sparkle
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
