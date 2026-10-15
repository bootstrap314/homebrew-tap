class AcMan < Formula
  desc "Command-line controller for Midea SmartHome air conditioners"
  homepage "https://github.com/bootstrap314/ac-man"
  version "0.0.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/bootstrap314/ac-man/releases/download/v#{version}/ac-man-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1b69056eb19648150b17155212035bbc0fc04c98acd08d0378e22a4663ecdbdc"
    end

    on_intel do
      url "https://github.com/bootstrap314/ac-man/releases/download/v#{version}/ac-man-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "91c33556c4a1d0bc0e26c57a1662a5db40db6ca595b51e975461a3c9f6e3b5d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bootstrap314/ac-man/releases/download/v#{version}/ac-man-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcb5222ea65d97ddcdbc7108594475a9f27dc8c761e43fc7502c696d1e7467f0"
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
