cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.11.2"
  sha256 arm:   "db494861cc391f2d91128bc0f2efdaec79333162c17a1387407bca22edb98b30",
         intel: "b5fb1704fa8eed76f6dafefa16a13eb0184f2117e16291dbc6e74199568d1641"

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
