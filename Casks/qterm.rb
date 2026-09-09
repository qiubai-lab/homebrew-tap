cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.10"

  on_arm do
    sha256 "04edd6a889b04faf60843d3907c21b161ceee7fa6c88bf7a60c5080b5ba8055d"
  end
  on_intel do
    sha256 "2c65000885ae6c709b5edc4fabae99bc646453fc2ca70ad3d5bab132e3dd00f7"
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
