cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.3.9"

  on_arm do
    sha256 "50ac27e52c43a4b4b18b15cc3352da8616d07db1472f97bbc93d93765cd28627"
  end
  on_intel do
    sha256 "3b48ba620a11f29f3f08d51556f239f0f63373afba60445a8d3c34b25068af8c"
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
