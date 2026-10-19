cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.14.3"
  sha256 arm:   "5aa6f461aa304bae7530e718b0f2d1ef0630e6126d9219348195219e7d5f42db",
         intel: "5e06849956074ca3852424dbfe927e05ec0e9691f9a8a53a0b797f24a3fbc517"

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
