class BroglowAT110 < Formula
  desc "Desk traffic light and menu bar monitor for local coding-agent sessions"
  homepage "https://github.com/broglow/broglow"
  license "MIT"

  keg_only :versioned_formula

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/broglow/broglow/releases/download/v1.1.0/broglow-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "517a4b02058938719cf86623292d343500ef78e8827d934ae306b11687eadee7"
    end
    on_intel do
      url "https://github.com/broglow/broglow/releases/download/v1.1.0/broglow-v1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "78cdd92cdfbaa63b4150298af1ebf41f7fe465e5142dc6aec5e14539ea753e68"
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
