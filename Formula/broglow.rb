class Broglow < Formula
  desc "Desk traffic light and menu bar monitor for local coding-agent sessions"
  homepage "https://github.com/broglow/broglow"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/broglow/broglow/releases/download/v1.0.0/broglow-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "ffd4897cf2b84821b0e63d2bc74a3123cbc8ea69b8ff95c8eda2e7e6368b24f8"
    end
    on_intel do
      url "https://github.com/broglow/broglow/releases/download/v1.0.0/broglow-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "ed7440ff9a334ea866ed0f4c377ca2f43fe9f67619a109c3270e08d377efe25d"
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
