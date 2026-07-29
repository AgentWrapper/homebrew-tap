cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.11.1"
  sha256 arm:   "7ef9d53813c97ca7ca9751d0bc2d9e23038f9d46e8a8b7c522873c18d2c8d7c1",
         intel: "28b48c2cda93c2d788d4bc3edbe9db84fc0bf4624a87a3caf3a8fc01593fb52c"

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
