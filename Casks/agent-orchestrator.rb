cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.13.4"
  sha256 arm:   "4edf647fc95bacf4031957cc8c13ab7159d15c0390b5ae975abe8a511ded7fd7",
         intel: "49ee19783d19d8f0e1fa0150e4bf47249a5810200904e29f0fa2260333ca2a57"

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
