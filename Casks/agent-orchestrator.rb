cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.10.3"
  sha256 arm:   "2a918681403203ac88d2d879e64841497a8c5ec98a300178ded487782fb7d786",
         intel: "e871566f8a0bb0e501d9d27c7de1bee08231c3bf2b207fb9343a559d9c07cae4"

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
  depends_on macos: ">= :big_sur"

  app "Agent Orchestrator.app"

  zap trash: [
    "~/.ao",
    "~/Library/Logs/Agent Orchestrator",
  ]
end
