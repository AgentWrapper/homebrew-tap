cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.14.2"
  sha256 arm:   "9f989fb2d96ed443938c1536b048a5850018330f916caa8807d6cb587db17529",
         intel: "5fa803f40b08db9b0414ac30ee61a90e1f4cfb3404a90e05acf903345c351f44"

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
