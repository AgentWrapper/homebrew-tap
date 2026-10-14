cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.14.0"
  sha256 arm:   "160164b322cc99f597834404f14a1eeead2356cdf6cc30bc1536f4b4a4fd550b",
         intel: "650ad1bddb2a11c0262652c0f5b769a1cb8eff1259cc8630a25beb1bd7b3bf6b"

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
