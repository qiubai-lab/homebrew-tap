cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.2"

  on_arm do
    sha256 "354451d36eb54863beed171a25b68e8f44446d4d40c75d465c2fa9bb39a2efba"
  end
  on_intel do
    sha256 "e9d1d1294b491887b9f46da7dad06142441c2227d957fa5943499c2334940cfd"
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
