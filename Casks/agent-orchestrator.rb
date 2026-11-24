cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.15.6"
  sha256 arm:   "f5af99032611e34930582d1c1bf9c71224f1b5e65e55e240377d8abdffdda23a",
         intel: "818c50da9ddbcaa5bd48467206b6cbfaad6b1ea33ab990e0c22060dadd78fdba"

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
