cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.4"

  on_arm do
    sha256 "3d2843664e301c561e5cc3301b71810b89d4f581adf672669761ebc33d3fc52e"
  end
  on_intel do
    sha256 "c540b97b611a65dd03bd044f0704e06b4e211e4eaa26579478d3f3ed4080f565"
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
