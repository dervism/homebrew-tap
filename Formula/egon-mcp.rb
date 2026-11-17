class EgonMcp < Formula
  desc "MCP server for creating, editing, checking and rendering Egon.io domain stories"
  homepage "https://github.com/dervism/egon-mcp"
  url "https://registry.npmjs.org/egon-mcp/-/egon-mcp-0.2.0.tgz"
  sha256 "6e7c82320123f029b28afcc865a63778a96c4df3d1cf335e8cb524afe37b892b"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/dervism/homebrew-tap/releases/download/egon-mcp-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "8f0db814bc81f8e1b83107ce22bc4ca72c8d558647e82f99d5f7fe0866ec9cdc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9c7c088fb71ae1a97e4f7db98ccd1c928c464bf2c89b192188f4a9a9c416dcc3"
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
