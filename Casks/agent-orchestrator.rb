cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.14.5"
  sha256 arm:   "73c3d409b71d4fc97ea785d42d83080963ed73741fddb74be92e1d1c79d6fb7b",
         intel: "f6ee073285f6591eaab4f0b29e09cf4fbd2a4eb32f41adc09c1e4d15fde78ac4"

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
