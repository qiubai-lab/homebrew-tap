cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.7"

  on_arm do
    sha256 "109fdba9b999e3c64186e8271376952d9e3834f56e9322980163638a1c36bea2"
  end
  on_intel do
    sha256 "a4f167e7b16f79c15abab615b955d8fd32f4933c9befb6fa9122e0e1758b4a1e"
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
