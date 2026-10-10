cask "qterm" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.5"

  on_arm do
    sha256 "d43c049eaa8869a8892dedce75eb21a67d2a77678d201f61ecd1532bf597826b"
  end
  on_intel do
    sha256 "40b1bbe0a791e093ca1d12f3f4e3ff2d96967b56bd0696ce9ec8bd3397817918"
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
