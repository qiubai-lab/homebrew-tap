cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.3"

  on_arm do
    sha256 "a8cc6a6476a0301f05a4f751068aa613b4bd3ac22e447bdf91b1beb999413bad"
  end
  on_intel do
    sha256 "d6ccfbfa72a1e2d2398cfd14c0d575bf9ad405d9dc0fd24c9214b18a2cf149e6"
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
