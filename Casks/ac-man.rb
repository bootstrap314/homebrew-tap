cask "ac-man" do
  version "0.0.2"
  sha256 "dd29ecf28f370591833ed73cff39e5ec7e354fca4335ba3593757bec1068408d"

  url "https://github.com/bootstrap314/ac-man/releases/download/v#{version}/ac-man-app-v#{version}-macos-apple-silicon.dmg"
  name "ac-man"
  desc "Menu-bar controller for Midea SmartHome air conditioners"
  homepage "https://github.com/bootstrap314/ac-man"

  depends_on arch: :arm64
  depends_on formula: "bootstrap314/tap/ac-man"
  depends_on macos: :ventura

  app "ac-man.app"
end
