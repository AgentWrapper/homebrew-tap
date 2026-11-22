cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.15.4"
  sha256 arm:   "f0ba445ca9cf1276e2bc17320ff33c01d8ad0ad9961df91dc703b8409387e88b",
         intel: "07598edfbb3c77f887f980ab631e289566996d01ae76afd37406e081cd1ad1ce"

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
