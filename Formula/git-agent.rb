class GitAgent < Formula
  desc "Generate git commit messages from your changes with a language model"
  homepage "https://github.com/dervism/git-agent"
  url "https://github.com/dervism/git-agent/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "4bd914f8cebc56fdb3ff4fea1b26f4d2137fa09bf11e41e68680a91d5572d8fc"
  license "MIT"
  head "https://github.com/dervism/git-agent.git", branch: "master"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-agent --version")

    # Needs no model server or keychain access, which the test sandbox may not allow.
    system bin/"git-agent", "config", "init", "--config", testpath/"config.toml"
    assert_match 'base_url = "http://localhost:1234/v1"', (testpath/"config.toml").read
  end
end
