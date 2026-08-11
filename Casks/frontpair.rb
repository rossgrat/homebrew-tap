cask "frontpair" do
  version "0.1.0"
  sha256 "3f19a359d75248208729e912758f9f26e28eba932282b18ff99193b9f9e9d1b1"

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
    Launch frontpaird once to approve the microphone prompt — it captures the
    interface, so macOS must grant it microphone access before audio flows:

      open /Applications/frontpaird.app

    Then select "frontpair" as the microphone in Zoom, Teams, or Discord. For
    music, enable Zoom's Original Sound / high-fidelity music mode and turn echo
    cancellation off, or its voice processing will gate the audio.

    The installer restarts coreaudiod, which briefly interrupts all audio.
  EOS
end
