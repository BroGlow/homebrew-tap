class BroglowAT103 < Formula
  desc "Desk traffic light and menu bar monitor for local coding-agent sessions"
  homepage "https://github.com/broglow/broglow"
  license "MIT"

  keg_only :versioned_formula

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/broglow/broglow/releases/download/v1.0.3/broglow-v1.0.3-aarch64-apple-darwin.tar.gz"
      sha256 "f9f4e193254096b0c3c7c916d2b21a85d0eeab763b1da44d6adfd7023a92b951"
    end
    on_intel do
      url "https://github.com/broglow/broglow/releases/download/v1.0.3/broglow-v1.0.3-x86_64-apple-darwin.tar.gz"
      sha256 "39160ee6879b5b0a6c6832636d560395263f0458211f00d73c678fe96c9018a6"
    end
  end

  def install
    bin.install "bin/broglow"
    pkgshare.install "firmware", "site"
    doc.install Dir["*.md"], "RUST-STANDARD-LIBRARY-COPYRIGHT.html"
  end

  def caveats
    <<~EOS
      Finish setup once (registers the coding-agent hooks, installs
      ~/Applications/BroGlow.app and starts it at login); repeat after upgrades:
        broglow install
      Firmware and manuals: #{pkgshare}
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/broglow --version")
  end
end
