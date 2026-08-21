cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.0"

  on_arm do
    sha256 "2232b3f6b49daf1f849efc975f0a65dd205646b426a6866a785b33e1f2e6af9a"
  end
  on_intel do
    sha256 "562dcfba97fce5f4a02b7253429b9a2c49dbd101832621c90f47073037e9ca36"
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
