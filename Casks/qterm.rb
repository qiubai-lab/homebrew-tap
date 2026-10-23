cask "qterm" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.7"

  on_arm do
    sha256 "383b613cca28ad40b5aac56ace34974401c055ad0f5e9650cc604a65669dc5ee"
  end
  on_intel do
    sha256 "e943ef03fe801347d6ba047d2b160eaefaa5b5174c8bfa4e3f21849e58a08be2"
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
