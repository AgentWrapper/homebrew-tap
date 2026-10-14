cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.14.1"
  sha256 arm:   "d552a2dd40bd607b2a71d54d87f61e1d75a90c5c2c110aba0e51612488d0c9c8",
         intel: "a75cc99059de0625e3bc68ebf6d2df43cd7c284ae4c92870ec86ffbfd64c5e94"

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
