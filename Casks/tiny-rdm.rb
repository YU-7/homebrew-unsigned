cask "tiny-rdm" do
  arch arm: "arm64", intel: "x64"

  version "1.2.7"
  sha256 arm:   "aaebc58a1f97505743bf05f2ab1cfc5e7c3e5841d90266ad836eaab74435f1a3",
         intel: "ac69281ec7d943d9e315a87c152a02ccca3da4cbf030c55db53f2504aa3f7898"

  url "https://github.com/tiny-craft/tiny-rdm/releases/download/v#{version}/TinyRDM_#{version}_mac_#{arch}.dmg"
  name "Tiny RDM"
  desc "Redis Desktop Manager"
  homepage "https://github.com/tiny-craft/tiny-rdm"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  auto_updates true

  app "Tiny RDM.app"

  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Tiny RDM.app"],
                   sudo: false
  end

  zap trash: [
   "~/Library/Caches/com.tinycraft.tinyrdm",
   "~/Library/Preferences/TinyRDM",
   "~/Library/Preferences/com.tinycraft.tinyrdm.plist",
   "~/Library/WebKit/com.tinycraft.tinyrdm"
  ]
end