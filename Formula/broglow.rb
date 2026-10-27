class Broglow < Formula
  desc "Desk traffic light and menu bar monitor for local coding-agent sessions"
  homepage "https://github.com/broglow/broglow"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/broglow/broglow/releases/download/v1.2.0/broglow-v1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "a0a0c4743320fda8902fe1ebb061b2f05ebdf357e8f4baf4ea533956e5e74952"
    end
    on_intel do
      url "https://github.com/broglow/broglow/releases/download/v1.2.0/broglow-v1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "baf762e4e9dfa39231e7cc5073c947cb0a0d214b25e1a2e57ced6eed0ace07ab"
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
