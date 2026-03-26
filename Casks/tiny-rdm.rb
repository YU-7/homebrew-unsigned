cask "tiny-rdm" do
  arch arm: "arm64", intel: "x64"

  version "1.2.6"
  sha256 arm:   "6a9de72ebb6be5b4fce1ebec3186edf8bd1ed5e3221bede082479c6ffe03a61b",
         intel: "ac69281ec7d943d9e315a87c152a02ccca3da4cbf030c55db53f2504aa3f7898"

  url "https://github.com/tiny-craft/tiny-rdm/releases/download/v#{version}/TinyRDM_#{version}_mac_#{arch}.dmg"
  name "Tiny RDM"
  desc "Redis Desktop Manager"
  homepage "https://github.com/tiny-craft/tiny-rdm"

  livecheck do
    url "https://github.com/tiny-craft/tiny-rdm/releases/latest"
    strategy :page_match
    regex(%r{tag/v?(\d+\.\d+\.\d+)}i)
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