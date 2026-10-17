cask "pulli" do
  version "0.4.0,20261017205529"
  sha256 "45c37062493b1884f629d18b666c8beedf3f8f7d3c910c585d9915bec7ad3e91"

  url "https://github.com/ijahongirmirzo/pulli/releases/download/v#{version.csv.first}-#{version.csv.second}/Pulli-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Pulli"
  desc "Copy photos and files from Android phones over USB, resuming after interruptions"
  homepage "https://github.com/ijahongirmirzo/pulli"

  livecheck do
    url "https://raw.githubusercontent.com/ijahongirmirzo/pulli/main/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Pulli.app"

  uninstall launchctl: "app.pulli.mac.helper",
            quit:      "app.pulli.mac"

  zap trash: [
    "~/Library/Application Support/Pulli",
    "~/Library/Caches/app.pulli.mac",
    "~/Library/Containers/app.pulli.mac.fileprovider",
    "~/Library/Containers/app.pulli.mac.widget",
    "~/Library/Group Containers/8Q2D6948R4.app.pulli.mac",
    "~/Library/HTTPStorages/app.pulli.mac",
    "~/Library/Preferences/app.pulli.mac.plist",
  ]
end
