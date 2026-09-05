cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.6"

  on_arm do
    sha256 "702cf82bf34c0d80c0235c2e6f1ee1df8a48d0a902681cc205ab57b90541bc26"
  end
  on_intel do
    sha256 "cbb43ec118e923dd0cde1149bf35b0bbf139abf8651dd401dcf14749bd7f93df"
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
