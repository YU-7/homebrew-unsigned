cask "github-stars-manager" do
  arch arm: "-arm64", intel: ""

  version "0.8.3"
  sha256 arm:   "b0ef11055a9f61b23b2e43dc3e8336526b297da815fde1916a8410e91947e3fc",
         intel: "c28671376e567ab57241f37a00eed41ddb289533af5affca1a0a8c9f945c6cdb"

  url "https://github.com/AmintaCCCP/GithubStarsManager/releases/download/v#{version}/GitHub.Stars.Manager-#{version}#{arch}.dmg"
  name "GitHub Stars Manager"
  desc "AI-powered GitHub starred repositories management tool"
  homepage "https://github.com/AmintaCCCP/GithubStarsManager"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  auto_updates true

  app "GitHub Stars Manager.app"

  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/GitHub Stars Manager.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/github-stars-manager",
    "~/Library/Caches/com.github-stars-manager.app",
    "~/Library/Logs/github-stars-manager",
    "~/Library/Preferences/com.github-stars-manager.app.plist",
    "~/Library/Saved Application State/com.github-stars-manager.app.savedState",
    "~/Library/WebKit/com.github-stars-manager.app",
  ]
end
