class GitAgent < Formula
  desc "Generate git commit messages from your changes with a language model"
  homepage "https://github.com/dervism/git-agent"
  url "https://github.com/dervism/git-agent/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "62d833d5cd34761654ec799a1057c24482baa4313dadb887a4a22c07a7ef254e"
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
