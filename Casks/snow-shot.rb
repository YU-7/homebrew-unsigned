cask "snow-shot" do
  arch arm: "aarch64",
      intel: "x64"

  version "0.7.8-beta"
  sha256 arm:   "placeholder",
         intel: "placeholder"

  url "https://github.com/mg-chao/snow-shot/releases/download/v#{version}/Snow.Shot_#{version}_#{arch}_darwin.dmg"
  name "Snow Shot"
  desc "Screen capture tool"
  homepage "https://github.com/mg-chao/snow-shot"

  livecheck do
    url "https://github.com/mg-chao/snow-shot/releases/latest"
    strategy :page_match
    regex(%r{tag/v?(\d+\.\d+\.\d+-beta)}i)
  end

  auto_updates true

  app "Snow Shot.app"

  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Snow Shot.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Snow Shot",
    "~/Library/Preferences/com.snow-shot.plist",
    "~/Library/Caches/com.snow-shot",
  ]
end