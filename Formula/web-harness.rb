class WebHarness < Formula
  desc "Lightweight local Codex-style execution host for ChatGPT Web"
  homepage "https://github.com/Chucklery/web-harness-rs"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.3.0/web-harness-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "359f140f582136a0d6e8ab1831a8ae6ca8cd6316ac1eb150bdc5eb143360c7f0"
    else
      url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.3.0/web-harness-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "9b612e287f0486b53f74599d48df978aee5380d5a39d0e7e0b314406c4f82491"
    end
  end

  on_linux do
    url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.3.0/web-harness-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9709db2677fb7f0fba81834e0b4bdd77938bfec766efbfc5c70c6af84f023e00"
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
