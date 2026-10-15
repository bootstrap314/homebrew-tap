class AcMan < Formula
  desc "Command-line controller for Midea SmartHome air conditioners"
  homepage "https://github.com/bootstrap314/ac-man"
  version "0.0.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/bootstrap314/ac-man/releases/download/v#{version}/ac-man-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "583039eae826bfb6f60a8337b5d0e6b26cc701c01f216fe180ccaf4513084b62"
    end

    on_intel do
      url "https://github.com/bootstrap314/ac-man/releases/download/v#{version}/ac-man-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "faa9462d37b6bb79f6bc9645f50a331eb033c214b5cd0d07bee357331041ae18"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/bootstrap314/ac-man/releases/download/v#{version}/ac-man-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5981ee26f70388022f9c7c1b7db79c03dcf0a957444a344c18e919ef86828111"
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
