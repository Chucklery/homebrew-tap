class WebHarness < Formula
  desc "Lightweight local Codex-style execution host for ChatGPT Web"
  homepage "https://github.com/Chucklery/web-harness-rs"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.1.0/web-harness-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "762f52480eb0c3ee76a2db974e9dd440b678827b7a50631d2fd4152ffc95071b"
    else
      url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.1.0/web-harness-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "b2c95179a7fa46bcef93420f4cc15b5a47dd8feb88ae098dcb857c68597d5c34"
    end
  end

  on_linux do
    url "https://github.com/Chucklery/web-harness-rs/releases/download/v0.1.0/web-harness-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b334b7d0a58df9f5b165c03a77990d0375db38ed8f4ceb98b7dfb13f11d03701"
  end

  def install
    bin.install "web-harness"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web-harness version")
  end
end
