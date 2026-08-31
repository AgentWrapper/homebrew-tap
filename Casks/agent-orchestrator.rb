cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.12.10"
  sha256 arm:   "6dd9388d6419fde3294bc0a09d9afe440c96967d32749641882e3b41e197a8ce",
         intel: "ce8cd02473d869d2ed5a433f726c6108f00916e8fc40e909a7becdae8fbbd0c8"

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
