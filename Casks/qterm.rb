cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.11"

  on_arm do
    sha256 "3298ee28da7056e9fe3e6a68a94d884af5f97124be71d7b5b130483b05961047"
  end
  on_intel do
    sha256 "d8e1440639da9bd82b31f98c5b0d842dac57c7d0f747e471ce54b808c7b852da"
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
