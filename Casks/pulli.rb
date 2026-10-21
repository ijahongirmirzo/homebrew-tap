cask "pulli" do
  version "0.4.2"
  sha256 "c092b7cb4f4188f030422a958998575c3578e9a9ba16ce02651fafa3e3283b5f"

  url "https://github.com/ijahongirmirzo/pulli/releases/download/v#{version}/Pulli-#{version}.dmg"
  name "Pulli"
  desc "Copy photos and files from Android phones over USB, resuming after interruptions"
  homepage "https://github.com/ijahongirmirzo/pulli"

  livecheck do
    url "https://raw.githubusercontent.com/ijahongirmirzo/pulli/main/appcast.xml"
    strategy :sparkle, &:short_version
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
