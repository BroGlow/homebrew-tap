class BroglowAT121 < Formula
  desc "Desk traffic light and menu bar monitor for local coding-agent sessions"
  homepage "https://github.com/broglow/broglow"
  license "MIT"

  keg_only :versioned_formula

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/broglow/broglow/releases/download/v1.2.1/broglow-v1.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "90b9f47021870a14532208497f1ece0f15ce731c232948a405d7abaaecda6cf2"
    end
    on_intel do
      url "https://github.com/broglow/broglow/releases/download/v1.2.1/broglow-v1.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "ff73b2794e74201e400d1813bdb4e30b660f27174dbaf134f24a1581eab7288b"
    end
  end

  def install
    bin.install "bin/broglow"
    pkgshare.install "firmware"
    doc.install Dir["*.md"], "RUST-STANDARD-LIBRARY-COPYRIGHT.html"
  end

  def caveats
    <<~EOS
      Finish setup once (registers the coding-agent hooks, installs
      ~/Applications/BroGlow.app and starts it at login); repeat after upgrades:
        broglow install
      Update a lamp over USB with `broglow flash` or the app's Lamp details.
      Firmware images: #{pkgshare}/firmware
      Manual: https://broglow.github.io/broglow/docs/
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/broglow --version")
  end
end
