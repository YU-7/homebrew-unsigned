cask "work-review" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.23"
  sha256 arm:   "d7d04e9300011ac8f42ef93c4544c91402e403b1dd36859813c4d6e833fe4a08",
         intel: ""

  url "https://github.com/wm94i/Work_Review/releases/download/v#{version}/Work_Review_#{version}_#{arch}.dmg"
  name "Work Review"
  desc "Work review tool"
  homepage "https://github.com/wm94i/Work_Review"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  auto_updates true

  app "Work Review.app"

  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Work Review.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.workreview",
    "~/Library/Caches/com.workreview",
    "~/Library/Preferences/com.workreview.plist",
  ]
end
