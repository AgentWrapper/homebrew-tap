cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.13.7"
  sha256 arm:   "c9f821e66d7fee74857766b9972574ec7a0d4602420b20b6f8f9cec5949873f5",
         intel: "f79db07016b66c2c75f4df7fe40ff979957a7dc81505161d4c8477ec9b5d90a1"

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
