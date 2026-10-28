class Broglow < Formula
  desc "Desk traffic light and menu bar monitor for local coding-agent sessions"
  homepage "https://github.com/broglow/broglow"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/broglow/broglow/releases/download/v1.4.0/broglow-v1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "499142669c723be2b390f53107780c723c75ace1ca8d3c9407736f0b9c0aa248"
    end
    on_intel do
      url "https://github.com/broglow/broglow/releases/download/v1.4.0/broglow-v1.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "68389e36231665679cc30bacf4add0f628aad3111285a25590ffe299d79bea48"
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
