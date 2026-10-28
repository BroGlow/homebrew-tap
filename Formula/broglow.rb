class Broglow < Formula
  desc "Desk traffic light and menu bar monitor for local coding-agent sessions"
  homepage "https://github.com/broglow/broglow"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/broglow/broglow/releases/download/v1.3.0/broglow-v1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "0a7a4ab1511b7e4027092709cb7d5548d0a72c739d9fc454857bf993e27ae749"
    end
    on_intel do
      url "https://github.com/broglow/broglow/releases/download/v1.3.0/broglow-v1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "a27f68be6fbad152583d5e032a1106d8d901183a2b3147c7560b48d185fd471c"
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
