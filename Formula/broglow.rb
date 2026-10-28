class Broglow < Formula
  desc "Desk traffic light and menu bar monitor for local coding-agent sessions"
  homepage "https://github.com/broglow/broglow"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/broglow/broglow/releases/download/v1.4.1/broglow-v1.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "91cb0f112d82e1c8d2d35eabdde73ea752124d608a7cf815c8193384178ac4a2"
    end
    on_intel do
      url "https://github.com/broglow/broglow/releases/download/v1.4.1/broglow-v1.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "998dd0f548713e81bed9b3d7051d691ba0eb7c7a8ee8e5169006d6686fcb6d3e"
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
