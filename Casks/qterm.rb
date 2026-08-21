cask "qterm" do
  version "0.1.2"
  sha256 "dc46f3b4be386e1072d705b66c2fdee85e746c9127315a3abe6da94898a65e23"

  url "https://github.com/qiubai-lab/Qterm/releases/download/v#{version}/Qterm_#{version}_aarch64.dmg"
  name "Qterm"
  desc "Cross-platform SSH terminal"
  homepage "https://github.com/qiubai-lab/Qterm"

  depends_on arch: :arm64

  app "Qterm.app"

  # Qterm is ad-hoc signed and not notarized; strip the quarantine
  # attribute so Gatekeeper does not report the app as damaged.
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