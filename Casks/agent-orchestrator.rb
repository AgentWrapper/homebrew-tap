cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.13.2"
  sha256 arm:   "eb4c47f4552ae6da468e28f84b016c936d46c14e32c812df569a3fb0d8a98c16",
         intel: "17e3bb8eea92b56824650bcec8fc4a7f60ee1c6708357773d9e7c72678e00c7e"

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
