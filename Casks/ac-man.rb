cask "ac-man" do
  version "0.0.4"
  sha256 "3f9af55f167376c54c79568371dba754c0e69ed04d2c435a837e65f67a4257a6"

  url "https://github.com/bootstrap314/ac-man/releases/download/v#{version}/ac-man-app-v#{version}-macos-apple-silicon.dmg"
  name "ac-man"
  desc "Menu-bar controller for Midea SmartHome air conditioners"
  homepage "https://github.com/bootstrap314/ac-man"

  depends_on arch: :arm64
  depends_on formula: "bootstrap314/tap/ac-man"
  depends_on macos: :ventura

  app "ac-man.app"
end
