class AcMan < Formula
  desc "Command-line controller for Midea SmartHome air conditioners"
  homepage "https://github.com/bootstrap314/ac-man"
  version "0.0.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/bootstrap314/ac-man/releases/download/v#{version}/ac-man-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2833ff46548dca60b71871da13ca9f0a74ebc28657cd0458f5c5e954ffd1071a"
    end

    on_intel do
      url "https://github.com/bootstrap314/ac-man/releases/download/v#{version}/ac-man-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "76ef5ee331ef6d48162c3ab133d45d95260bae6b21d724d43c4ee73e51ff20fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bootstrap314/ac-man/releases/download/v#{version}/ac-man-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a5167a1611556233d0e8388342991c410031cdb99da6bd9cdb67ed06c0e2bca5"
    end

    depends_on arch: :x86_64
  end

  def install
    bin.install "ac-man"
    doc.install "README.md", "SECURITY.md", "THIRD_PARTY_NOTICES.md", "LICENSE", "licenses", "docs"
  end

  def caveats
    return unless OS.linux?

    <<~EOS
      The Linux binary requires glibc 2.36 or newer.
      Signing in requires a running D-Bus session and Secret Service credential store
      (such as GNOME Keyring or KWallet with Secret Service support).
    EOS
  end

  test do
    assert_match "ac-man #{version}", shell_output("#{bin}/ac-man --version")
    assert_match "vertical-angle", shell_output("#{bin}/ac-man 1 --help")
    assert_match "Fan speed must be a whole percentage from 1 to 100, or auto.",
                 shell_output("#{bin}/ac-man 1 fan 101 2>&1", 1)
  end
end
