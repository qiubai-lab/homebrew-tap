cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.5"

  on_arm do
    sha256 "d523f8312ac804ab11bb6d73f3b6446dbe31a411826d4f4830b94ce14c10249b"
  end
  on_intel do
    sha256 "7f76aa972d165e4fcd50b8dc6a40114d414eb5faee2d56ce42e87ce6b72e0792"
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
