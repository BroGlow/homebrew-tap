class Broglow < Formula
  desc "Desk traffic light and menu bar monitor for local coding-agent sessions"
  homepage "https://github.com/broglow/broglow"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/broglow/broglow/releases/download/v1.0.2/broglow-v1.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "f26f0a5dea3929b909f1f8873a10717b1c9c23cc9bf8567862757b53e697a804"
    end
    on_intel do
      url "https://github.com/broglow/broglow/releases/download/v1.0.2/broglow-v1.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "39755fa8b21544d0fd9c1e9c3cb63658b06e4e7f0b9822c2373ac986d45f75ec"
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
