# A cask for a personal tap (github.com/sue738/homebrew-tap, Casks/):
#
#   brew install --cask sue738/tap/rally
#
# Per release: bump `version` and both sha256 (from app/release.sh's SHA256SUMS).
# Not notarized, so postflight clears the quarantine for Gatekeeper.
cask "rally" do
  arch arm: "arm64", intel: "x86_64"

  version "0.0.18"
  sha256 arm:   "65e62733084123ca321d6ace1b615bea322057764238f0e6771d1f7c655106cc",
         intel: "03b3d195802f3123242a7fa171149d4e6f03e0ab73815fd1c8566ce6a86c49a3"

  url "https://github.com/sue738/rally/releases/download/v#{version}/Rally-#{version}-#{arch}.dmg"
  name "Rally"
  desc "One list of every coding-agent session on the Mac, and a place to answer them"
  homepage "https://github.com/sue738/rally"

  depends_on macos: :sonoma

  app "Rally.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Rally.app"]
  end

  zap trash: ["~/.rally", "~/Library/Preferences/dev.sue738.rally.plist", "~/Library/WebKit/dev.sue738.rally"]
end
