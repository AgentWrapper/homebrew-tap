cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.11.0"
  sha256 arm:   "aee7024c9ead2a268f13ba545827cd9ef42e46a4550aa153ba37e7f0faf39113",
         intel: "1ae2de4fc270c6ce499589862b36b6cee76d8e092581cd4cf55489efff2b1d2f"

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
