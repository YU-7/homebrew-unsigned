cask "frpc-desktop" do
  arch arm: "arm64"

  version "1.2.5"
  sha256 arm:   "b1f424214cfaac96c4c961d94eab362ea72038fb70d6d6ce2040f5bc232a513c"
         
  url "https://github.com/luckjiawei/frpc-desktop/releases/download/v#{version}/frpc-desktop-#{version}-#{arch}.dmg"
  name "frpc Desktop"
  desc "GUI client for frp (fast reverse proxy)"
  homepage "https://github.com/luckjiawei/frpc-desktop"

  livecheck do
    url "https://github.com/luckjiawei/frpc-desktop/releases/latest"
    strategy :page_match
    regex(%r{tag/v?(\d+\.\d+\.\d+)}i)
  end

  auto_updates true

  app "Frpc-Desktop.app"

  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Frpc-Desktop.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/frpc-desktop",
    "~/Library/Preferences/com.frpc-desktop.plist",
    "~/Library/Caches/com.frpc-desktop",
  ]
end