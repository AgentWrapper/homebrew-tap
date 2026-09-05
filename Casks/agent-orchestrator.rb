cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.12.11"
  sha256 arm:   "146557f3fb96b9458437690ecdfb916ec85e123e84818d938b01f99f7a5245ee",
         intel: "3374c16aacaff81fa09b62b34daa1dc3016375243f0f6a4307a259cc8b478a7a"

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
