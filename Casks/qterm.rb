cask "qterm" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.8"

  on_arm do
    sha256 "a3030effcfe24f923e09b31a93ee4e393903802163dd76566989a07c4baac190"
  end
  on_intel do
    sha256 "sha256:f1adc478e9a4d2edee099e1f05e3b688f638ef3d3246bff7f5c250ffb7173225"
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
