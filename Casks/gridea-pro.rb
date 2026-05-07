cask "gridea-pro" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.1"
  sha256 arm:   "873e7cedb78f7c4b824d6975f50b5492aea515d55c0a8d6d8eac9d7c024c6b81",
         intel: "27a8d4a74bd6812ce0ebf1cf357db62febd351ffd823eb00d16e0ed1cccb8d33"

  url "https://github.com/Gridea-Pro/gridea-pro/releases/download/v#{version}/Gridea.Pro_v#{version}_macos_#{arch}.dmg"
  name "Gridea Pro"
  desc "Simple and powerful static blog writing client"
  homepage "https://github.com/Gridea-Pro/gridea-pro"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  auto_updates true

  app "Gridea Pro.app"

  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Gridea Pro.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/gridea-pro",
    "~/Library/Caches/gridea-pro",
    "~/Library/Logs/gridea-pro",
    "~/Library/Preferences/gridea-pro.plist",
    "~/Library/Saved Application State/gridea-pro.savedState",
    "~/Library/WebKit/gridea-pro",
  ]
end
