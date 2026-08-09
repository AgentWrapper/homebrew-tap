cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.12.2"
  sha256 arm:   "e49158cf76c1e7ef6969452d07e16f5a493f7ddcf0e68125b2d6191bf6a64b16",
         intel: "d08772affd33b37f65210af1ec32efd5aaa42f23b1c7dafa617ca52b7a96dc83"

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
