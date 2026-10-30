cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.14.8"
  sha256 arm:   "46aba56e66e3b1ae77a1ea38d343a1f6e779a5cb29ebd32cddb864e3873f99ca",
         intel: "29c6a255c1a4ccf7cf65b06533e3bb61993742f1fb08909e0b500ed14f22e9dc"

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
