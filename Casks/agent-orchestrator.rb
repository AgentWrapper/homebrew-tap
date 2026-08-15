cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.12.5"
  sha256 arm:   "52889b4c17b28406c240cc8fda1f30ed25a319bfcbd3869c7153dfed32b7c71f",
         intel: "830d8e9194a01ea94759a842943eac9336350b28331e14477f22287b7a4e5a91"

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
