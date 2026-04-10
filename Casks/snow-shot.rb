cask "snow-shot" do
  arch arm: "aarch64",
      intel: "x64"

  version "0.7.8-beta"
  sha256 arm:   "ea041b903e7d2c0a2520f7fe01ee52a4628c7e1edb0bdcb828c036d78c5dc341",
         intel: "5d37c525ee88e541e6e8ad7d29326b7e460b62a02b8f7ca01c81ce1c44f48036"

  url "https://github.com/mg-chao/snow-shot/releases/download/v#{version}/Snow.Shot_#{version}_#{arch}_darwin.dmg"
  name "Snow Shot"
  desc "Screen capture tool"
  homepage "https://github.com/mg-chao/snow-shot"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  auto_updates true

  app "Snow Shot.app"

  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Snow Shot.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.chao.showshot",
    "~/Library/Caches/com.chao.snowshot",
    "~/Library/Logs/com.chao.snowshot",
    "~/Library/Preferences/com.chao.snowshot.plist",
    "~/Library/WebKit/com.chao.snowshot",
  ]
end