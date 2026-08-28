cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.12"

  on_arm do
    sha256 "8f8e567d6f0bd3c2bd093572c489a3d4a7ba30f34d37041a9bb63c5b2500636c"
  end
  on_intel do
    sha256 "2e3ce56d69790e0957f517da90a4c2cce6a8a8edfda75188bfc316002ad936f9"
  end

  url "https://github.com/qiubai-lab/Qterm/releases/download/v#{version}/Qterm_#{version}_#{arch}.dmg"
  name "Qterm"
  desc "Cross-platform SSH terminal"
  homepage "https://github.com/qiubai-lab/Qterm"

  app "Qterm.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Qterm.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.qiubai.qterm",
    "~/Library/Caches/com.qiubai.qterm",
    "~/Library/HTTPStorages/com.qiubai.qterm",
    "~/Library/Preferences/com.qiubai.qterm.plist",
    "~/Library/Saved Application State/com.qiubai.qterm.savedState",
    "~/Library/WebKit/com.qiubai.qterm",
  ]
end
