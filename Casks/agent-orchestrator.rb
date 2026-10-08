cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.13.5"
  sha256 arm:   "e83e20dcab868d69f969ec1384ce9aee308e87ba50e92cac366624f144f6c184",
         intel: "2e6a9f87565fe3f9dcecd07bdfb5c369a6f70734a397603b413a92eadef26b77"

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
