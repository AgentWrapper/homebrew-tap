cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.12.1"
  sha256 arm:   "f9cf073e5dece2b647875473d0f44628cd7d4451c08ea61dbe4dc4e83b9607cb",
         intel: "c9358720ddd063d0575c5733945da6d556c6b8058ac272ba07d2c856b398482d"

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
