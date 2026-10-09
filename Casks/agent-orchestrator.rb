cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.13.6"
  sha256 arm:   "26f9d75c725130a9070155deaaa567ed4485aa7fb8ba18b4169fb7ebc0b9bcd0",
         intel: "ec646909cbf979f9770932262359d67f5929743e489564c0741bed4bc85b16a7"

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
