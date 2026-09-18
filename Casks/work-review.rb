cask "work-review" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.2"
  sha256 arm:   "ae90f177c8faf50033289f424e438e10586f11adaee9689409774e883bab8b83",
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
