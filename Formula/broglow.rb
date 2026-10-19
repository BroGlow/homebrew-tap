class Broglow < Formula
  desc "Desk traffic light and menu bar monitor for local coding-agent sessions"
  homepage "https://github.com/broglow/broglow"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/broglow/broglow/releases/download/v1.0.1/broglow-v1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "b1b074cb8cacd1b852ba4023832704c298bc61e5e37a65b5a643796580e7d507"
    end
    on_intel do
      url "https://github.com/broglow/broglow/releases/download/v1.0.1/broglow-v1.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "5375d237b8819890f3310845d32f4af33812e7738ec7725f7c332f16a8297a39"
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
