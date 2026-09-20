class WebHarness < Formula
  desc "Lightweight local Codex-style execution host for ChatGPT Web"
  homepage "https://github.com/Chucklery/web-harness-rs"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.3.2/web-harness-0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "b67e7dc05ca3b6809a041ccc9c21666a835981bbc2d7d73c98c818e4131e9e60"
    else
      url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.3.2/web-harness-0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "8b50403afe3dc5f1d30a5d1b0bb4dbd69fd4ae7a27fd86ef266d18118ebea21f"
    end
  end

  on_linux do
    url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.3.2/web-harness-0.3.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d409f1e5cd7a72b277fc2fdb2ad070abe01a7d45b833a7f907bc6f5614eea3d3"
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
