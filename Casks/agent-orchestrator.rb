cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.12.6"
  sha256 arm:   "8476688bbbdc66b113d7881059293719cdbdd00adf349fab16ada1420310a901",
         intel: "9c27a0b19361e8f855dfe540bed0d2f9add55de2a23977320dd63688fb9f047e"

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
  depends_on formula: "tmux"
  depends_on macos: :big_sur

  app "Agent Orchestrator.app"

  zap trash: [
    "~/.ao",
    "~/Library/Logs/Agent Orchestrator",
  ]
end
