cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.15.1"
  sha256 arm:   "7be6fb7b9b3c031525872c155542dcd19670c6d9b78e2e70e1aa2640a0851df9",
         intel: "6d810d40be801104409d01ee50b3f685595708def8bace3f1c154f83c6781ddc"

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
