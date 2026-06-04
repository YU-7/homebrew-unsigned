cask "netcatty" do
  arch arm: "arm64", intel: "x64"

  version "1.1.20"
  sha256 arm:   "2a6e88bfa0cddb46b0dde53bb8a92cf07f19e5a5a48b998f2e12975efd9730bb",
         intel: "d986010a90fdfe030d42a0a67636d74371e0323387cc9308f804ac2f68ca2e0d"

  url "https://github.com/binaricat/Netcatty/releases/download/v#{version}/Netcatty-#{version}-mac-#{arch}.dmg"
  name "Netcatty"
  desc "Modern SSH client, SFTP browser and terminal manager"
  homepage "https://github.com/binaricat/Netcatty"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  auto_updates true

  app "Netcatty.app"

  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Netcatty.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Netcatty",
    "~/Library/Caches/com.netcatty.app",
    "~/Library/Logs/Netcatty",
    "~/Library/Preferences/com.netcatty.app.plist",
    "~/Library/Saved Application State/com.netcatty.app.savedState",
    "~/Library/WebKit/com.netcatty.app",
  ]
end
