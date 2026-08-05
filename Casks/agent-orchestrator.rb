cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.12.0"
  sha256 arm:   "04840ad1365d5ffab4d2d8d0c0b04fb26ba2a75ca60e2bfc8a550ed2d138b831",
         intel: "918806cc68b60b8c716a1e566d3299d0559f3ed11724971392e72312b873e691"

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
