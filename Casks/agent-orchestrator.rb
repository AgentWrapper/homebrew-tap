cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.15.3"
  sha256 arm:   "4e66fe5c7d2339974c75dc6aa46af2711285b0fb97670dfee619f7a099d64a09",
         intel: "eb09fee47a02341bb9b16ddadf44e31ed2ab2304bc5657f6a91d20fe2b94b7a4"

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
