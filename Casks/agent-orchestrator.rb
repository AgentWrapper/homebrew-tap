cask "agent-orchestrator" do
  arch arm: "arm64", intel: "x64"

  version "0.14.4"
  sha256 arm:   "d1664deda69f7e5fa336e9ee705d6db5290797215303f2314f0598fb362b726b",
         intel: "18c423ee54c3088b7cc536dc36a191f771eededd609742f1a76074c898a4cfeb"

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
