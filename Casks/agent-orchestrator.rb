cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.13.0"
  sha256 arm:   "53124dbed831082d15911e3b545f2c631851b9add618d3527954a709d9e44276",
         intel: "65cb27985989cb2f51472ea58a0178db1dbfdc53b6f65cedf75cfb55ff8a0776"

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
