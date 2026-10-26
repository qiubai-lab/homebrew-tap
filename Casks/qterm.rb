cask "qterm" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.0"

  on_arm do
    sha256 "acbb4899fbbb917b53d781e496c94ff9a985c0301637ff906c14127dd473d51f"
  end
  on_intel do
    sha256 "3aef560477a9c0c50188166e05ceeb0680efda08979b3c6fdf71db0f47fb0e0e"
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
