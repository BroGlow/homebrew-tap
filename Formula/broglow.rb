class Broglow < Formula
  desc "Desk traffic light and menu bar monitor for local coding-agent sessions"
  homepage "https://github.com/broglow/broglow"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/broglow/broglow/releases/download/v1.0.1/broglow-v1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "387dabbaf884aa2f3952c3fe4ad0dfdb36b1aff7109a3b3d8664869437641156"
    end
    on_intel do
      url "https://github.com/broglow/broglow/releases/download/v1.0.1/broglow-v1.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "3fc16d84cfa0dae9c34d961f1337d2727df310890fbc98c13a726b68bdc6525c"
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
