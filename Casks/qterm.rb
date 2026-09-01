cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.1"

  on_arm do
    sha256 "eb907690e1676e7eae8150e61a1ec70896ed65634e7b81dcf176e50d049c6ce1"
  end
  on_intel do
    sha256 "1d755b76daf28b7f47f83a726986132c92d295e2d96d9ec081f11b0c09481989"
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
