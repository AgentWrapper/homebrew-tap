cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.12.12"
  sha256 arm:   "797f179808f1a70547122f0f11affd88843cd4ecdb72bd35277a66346b1cf61a",
         intel: "5bb5851f2220d435050e624d30ac3eda58c06e993a5cdbe79165f5724c6c3c57"

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
