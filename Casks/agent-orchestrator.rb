cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.14.7"
  sha256 arm:   "12eecc9cc90479caeed07ac3a1cd214db260d1fcc53060ecf1569424e951a694",
         intel: "ac3caa26dd1163d48b689788b86e092a7f686b3c0b9bc5641e0928b00ab62953"

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
