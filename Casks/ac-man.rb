cask "ac-man" do
  version "0.0.3"
  sha256 "41005335e269e35487aeb455d302bd5ec827d708eb9287bb481c0e8d5545b4ed"

  url "https://github.com/bootstrap314/ac-man/releases/download/v#{version}/ac-man-app-v#{version}-macos-apple-silicon.dmg"
  name "ac-man"
  desc "Menu-bar controller for Midea SmartHome air conditioners"
  homepage "https://github.com/bootstrap314/ac-man"

  depends_on arch: :arm64
  depends_on formula: "bootstrap314/tap/ac-man"
  depends_on macos: :ventura

  app "ac-man.app"
end
