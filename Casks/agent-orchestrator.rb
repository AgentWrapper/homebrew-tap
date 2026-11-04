cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.14.9"
  sha256 arm:   "b80f65819be07c1695b356020ccd05d425de18814bb514ac5abcb2cb9950365c",
         intel: "71fb595dd01645a6b835a1e05229b11827eb749b7dc8da4502b6a03898439035"

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
