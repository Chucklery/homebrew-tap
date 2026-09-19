class WebHarness < Formula
  desc "Lightweight local Codex-style execution host for ChatGPT Web"
  homepage "https://github.com/Chucklery/web-harness-rs"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.3.1/web-harness-0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "33588b27e02eb3f301c37c6fb28d347d765b7745e0dd689f072ccf8e0580c291"
    else
      url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.3.1/web-harness-0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "4aa3cbe1e982f142a117cf7ff72c05a9de85045adea321525a31bfda9f77c312"
    end
  end

  on_linux do
    url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.3.1/web-harness-0.3.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "07dfcdd699b74ededfde2901e67312b31508016192dc68ee08e14bce22bc6f7a"
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
