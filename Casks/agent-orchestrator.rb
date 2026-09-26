cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.13.1"
  sha256 arm:   "4f52d44f3f2bc07455b1889af1743b7dddfceefe498f072d87aa26f0037c3d11",
         intel: "898c8252ebf2149f5038bd75486324b20f36ce41c39a47df5903aa11d7fa6140"

  url "https://github.com/AgentWrapper/agent-orchestrator/releases/download/v#{version}/agent-orchestrator-darwin-#{arch}.zip",
      verified: "github.com/AgentWrapper/agent-orchestrator/"
  name "Agent Orchestrator"
  desc "Orchestrator for running parallel coding agents"
  homepage "https://github.com/AgentWrapper/agent-orchestrator"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app self-updates via electron-updater from GitHub Releases, so Homebrew
  # only installs the initial version and must not fight the in-app updater.
  auto_updates true
  depends_on macos: :big_sur

  app "Agent Orchestrator.app"

  zap trash: [
    "~/.ao",
    "~/Library/Logs/Agent Orchestrator",
  ]
end
