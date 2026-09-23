cask "qterm" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.0"

  on_arm do
    sha256 "0ef99852352cd6290da79d707d3c0b8a902c0cf8027fff3e8ae04c6486aa5554"
  end
  on_intel do
    sha256 "ab53b3ecfcd3d47a4b9fa8eb537086d52775870dec0b01432654186ef8060ac5"
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
