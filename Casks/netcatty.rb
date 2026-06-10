cask "netcatty" do
  arch arm: "arm64", intel: "x64"

  version "1.1.28"
  sha256 arm:   "f0e78dabd2c6bac93227c0f60b4aaa94c931c576a290ab366e07d8a1f1c1a58e",
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
