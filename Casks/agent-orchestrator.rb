cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.13.3"
  sha256 arm:   "160ef302b79709a7f80c1133c58e4ad2a3e4c20771f6a1396c6e71634ec4aedc",
         intel: "3dad6048f5631599477b9ded123fd7849fb1cbb1d89942bf6362445f765c8d5c"

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
