cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.12.7"
  sha256 arm:   "a2f85d382a1bcd25e5fbd8029009a7c4a31aa735485bfcac3043d80e3666661f",
         intel: "3c704f65bbd81f177018b4ff923857ba133e631423a29584384e9bdf47ee697c"

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
