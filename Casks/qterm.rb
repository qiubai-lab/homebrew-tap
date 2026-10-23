cask "qterm" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.6"

  on_arm do
    sha256 "27cd7059f6a741d2d7128b8f5f2b470c691dfc0fae0c7861d62016eebde899cb"
  end
  on_intel do
    sha256 "d86bc6eb4b0b86db03bb90fa69b2dc9df156fbaa67305b35d8bb1e9b48d13ac6"
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
