cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.15.5"
  sha256 arm:   "0bd76cf29cf8a831dd1dac5bf3209ad4c6ae0c860145835a6a04896840ab64a9",
         intel: "8f8852defc305327442744e91b4d8e99e9461ee75e578cad90c885633c4813bf"

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
