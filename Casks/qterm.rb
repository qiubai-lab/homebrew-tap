cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.0"

  on_arm do
    sha256 "3ad021e9df55c274766298c42e78eae5318d83bcfaa57638498fe36ea8e6e8df"
  end
  on_intel do
    sha256 "e1284ff2fc66a8325ce3759923c50eff9e2652188a8601f5c1dd8fbac9051a68"
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
