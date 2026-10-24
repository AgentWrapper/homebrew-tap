cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.14.6"
  sha256 arm:   "76d4167d658eea20c3df45eedbcea52228418d18127b8b59823bf5d6b8f5f1b9",
         intel: "6578bb781826f51d8c55b9a88fa5e9f8d19b9bd6c2ec83c90446f936ded61f04"

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
