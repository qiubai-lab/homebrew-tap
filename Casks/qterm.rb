cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.2"

  on_arm do
    sha256 "34580727de4a98e9dcf00f5087b96c33dd723ab9d0c21ef4e6877362c2de26b8"
  end
  on_intel do
    sha256 "c71fda7d0e4fb667487970cf9d26080f7175c3b5ec01414087b9959d09ed1941"
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
