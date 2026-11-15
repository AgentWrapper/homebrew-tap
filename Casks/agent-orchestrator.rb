cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.15.2"
  sha256 arm:   "2382e4e339ed99ab0c6ed2fa5409bafa79b017355f603b934d042ea57122177f",
         intel: "0bbb59bcb7b0bf5ac7d62ec6eace5df5aa3c47c0570faea05c141c491725c5de"

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
