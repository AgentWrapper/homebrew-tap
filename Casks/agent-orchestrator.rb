cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.12.4"
  sha256 arm:   "1d5f6616d1ed5ab911f4ed0591166bcd79e285fcf2b196f5b1bbf1de6de88829",
         intel: "35468b920b8494aad7ae224b2d88085fb5aae6394ccb5e0e39592c8d299caa8b"

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
