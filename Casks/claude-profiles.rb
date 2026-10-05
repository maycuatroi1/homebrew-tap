cask "claude-profiles" do
  version "0.1.0"
  sha256 "fa7c7c558d13fb1693c94c0e63bd3b0ba523576998bd9ea125195a4bd2cffaee"

  url "https://github.com/maycuatroi1/claude-profiles/releases/download/v#{version}/Claude-Profiles-#{version}.zip"
  name "Claude Profiles"
  desc "Run Claude Desktop under several accounts and switch between them"
  homepage "https://github.com/maycuatroi1/claude-profiles"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "Claude Profiles.app"

  # The app is ad-hoc signed, not notarized. Without this, Gatekeeper refuses
  # its first launch because brew keeps the download's quarantine flag.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Claude Profiles.app"]
  end

  uninstall quit: "tech.omelet.ClaudeProfiles"

  # Profile settings, sync state and the data folders of profiles created in
  # the app (moved to the Trash). Claude's own folder and ~/.claude stay.
  zap trash: "~/Library/Application Support/tech.omelet.ClaudeProfiles"
end
