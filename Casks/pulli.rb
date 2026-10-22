cask "pulli" do
  version "0.4.4"
  sha256 "227f0c3500d05c74457ec6635d1e90de931deb56c04f7e4c7fdf8c8015dc7305"

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
