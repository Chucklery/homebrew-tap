class WebHarness < Formula
  desc "Lightweight local Codex-style execution host for ChatGPT Web"
  homepage "https://github.com/Chucklery/web-harness-rs"
  version "0.3.4"
  license "Apache-2.0"

  depends_on "ripgrep"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.3.4/web-harness-0.3.4-aarch64-apple-darwin.tar.gz"
      sha256 "5562aeafc5498863b5997b9779e5ade4a220d33d8472a70f6e3ac8a42345efb1"
    else
      url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.3.4/web-harness-0.3.4-x86_64-apple-darwin.tar.gz"
      sha256 "1a7e423163c2f843517c9e4273eb43f93b267f63386fecb9878962d1a63943a4"
    end
  end

  on_linux do
    url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.3.4/web-harness-0.3.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "15797750e7c6e61a7ef0f8c75638f6a25acdcdff4a0ed34f6df06027fefb48c3"
  end

  def install
    bin.install "web-harness"
    libexec.install "libexec/web-harness"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web-harness version")
    assert_predicate libexec/"web-harness/tunnel-client", :executable?
  end
end
