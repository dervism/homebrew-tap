class EgonMcp < Formula
  desc "MCP server for creating, editing, checking and rendering Egon.io domain stories"
  homepage "https://github.com/dervism/egon-mcp"
  url "https://registry.npmjs.org/egon-mcp/-/egon-mcp-0.1.1.tgz"
  sha256 "755bef7349e802f5fd74a2d13fbe32b83383297ee81eb76b2c85e6f35a9ea21e"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/dervism/homebrew-tap/releases/download/egon-mcp-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "d043f890e9f8833a6fe604be871f4aa119d04168c3133a9c9219f5f241f2f26a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7c144166857d5d06f65efe1d4a20352cd2e4bab5af31a0382b87c8b4100dfc08"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
    # The agent skill ships in the package; a path under opt stays the same across upgrades.
    pkgshare.install_symlink libexec/"lib/node_modules/egon-mcp/skill"
  end

  def caveats
    <<~EOS
      The skill that teaches agents Domain Storytelling and the egon-mcp tools is in
        #{opt_pkgshare}/skill
      To use it in Claude Code, link it into your skills:
        mkdir -p ~/.claude/skills && ln -sfn #{opt_pkgshare}/skill ~/.claude/skills/egon-mcp-skill
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/egon-mcp --version")

    # The server answers on stdio and stops when its input ends.
    requests = <<~JSON
      {"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"brew","version":"1"}}}
      {"jsonrpc":"2.0","method":"notifications/initialized"}
      {"jsonrpc":"2.0","id":2,"method":"tools/list"}
    JSON
    assert_match "build_story", pipe_output("#{bin}/egon-mcp --root #{testpath}", requests, 0)
  end
end
