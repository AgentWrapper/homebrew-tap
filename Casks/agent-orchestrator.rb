cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.12.8"
  sha256 arm:   "3888a2805bea9c86657b4c457c8ab34cae0eb379481244510631c1f6aac60317",
         intel: "95ae32b8810c6bfea8b2de61a351963efebcd14f046f69cdbff16b8368369364"

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
