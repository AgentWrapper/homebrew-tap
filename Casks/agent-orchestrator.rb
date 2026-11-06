cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.14.10"
  sha256 arm:   "4a53349c3ac228a886bdc243f0e4fa87d7e3c09bbde2ee4cddd4e7c0cc9f6d3e",
         intel: "839f2b5db940abf4f1f782d891d654bd592239a7dba3e4ec3c6a32b00344e49d"

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
