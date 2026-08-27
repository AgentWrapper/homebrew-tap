cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.12.9"
  sha256 arm:   "69ea0dd49e16c91604d674e61dd706f59e333ea7d34c042518f985722260d1f6",
         intel: "5fe43787452e126d3a2d279da3c131970626ed448732e57ff4a393e8086d6a27"

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
