cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.10"

  on_arm do
    sha256 "806146835564aaedbf7f724bd16a9e27e226ca1b14a614ca8f69e50f3697e471"
  end
  on_intel do
    sha256 "b7087538f12e9f4ff63d56b0c288ed3340b73b48c988748cf8c7a7519969ba23"
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
