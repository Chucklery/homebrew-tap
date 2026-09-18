class WebHarness < Formula
  desc "Lightweight local Codex-style execution host for ChatGPT Web"
  homepage "https://github.com/Chucklery/web-harness-rs"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.2.0/web-harness-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "8db62cbb88c674ac0a74514d7d8b2bb05bbf110fadfe2ab3c5a3f1a8e8a9f90e"
    else
      url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.2.0/web-harness-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "537cf2a3e1131e3047fa81a55f4be20963d83b5182f1c7703a6ed32f488e93ea"
    end
  end

  on_linux do
    url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.2.0/web-harness-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4a3dd4e992c956748aea6fb9c4fdf14dc497ae7273de8806f90804112458c7d1"
  end

  def install
    bin.install "web-harness"
    (libexec/"web-harness").install Dir["libexec/web-harness/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web-harness version")
    assert_predicate libexec/"web-harness/tunnel-client", :executable?
  end
end
