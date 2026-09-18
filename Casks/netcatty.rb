cask "netcatty" do
  arch arm: "arm64", intel: "x64"

  version "1.1.83"
  sha256 arm:   "daedb8c5b9ba2478379979249f6f23d6a617d4f362b0c50ea72fd57bf24289d9",
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
