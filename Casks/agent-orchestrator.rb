cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.15.0"
  sha256 arm:   "59935adbe6c37b339ccee58fe056b2f0a9f641d6b32f4f87d3d152be04de196f",
         intel: "c50d52b50fd559f3ce7cdc56ba72d218ed909dd4bb9eee855b6f85e9e5d6e96d"

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
