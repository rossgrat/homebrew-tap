cask "frontpair" do
  version "0.1.1"
  sha256 "26e97eeabd88896a1242fb7689699e7b315f2ad7357f07eaa5081f89ef7c7d0a"

  url "https://github.com/rossgrat/frontpair/releases/download/v#{version}/frontpair-#{version}.pkg"
  name "frontpair"
  desc "Share an audio interface's hardware loopback into calls as a microphone"
  homepage "https://github.com/rossgrat/frontpair"

  depends_on macos: :monterey

  # The package is ad-hoc signed, so the installer needs to be told to accept it.
  pkg "frontpair-#{version}.pkg", allow_untrusted: true

  uninstall launchctl: "dev.grattafiori.frontpaird",
            quit:      "dev.grattafiori.frontpaird",
            pkgutil:   "dev.grattafiori.frontpair",
            delete:    [
              "/Applications/frontpaird.app",
              "/Library/Audio/Plug-Ins/HAL/frontpair.driver",
              "/Library/LaunchAgents/dev.grattafiori.frontpaird.plist",
            ]

  caveats <<~EOS
    macOS will prompt once for microphone access — approve it. frontpaird
    captures the audio interface, so without that grant it runs but carries
    silence. It starts again at every login; see /tmp/frontpaird.log.

    Then select "frontpair" as the microphone in Zoom, Teams, or Discord. For
    music, enable Zoom's Original Sound / high-fidelity music mode and turn echo
    cancellation off, or its voice processing will gate the audio.

    The installer restarts coreaudiod, which briefly interrupts all audio.
  EOS
end
