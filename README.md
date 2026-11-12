# Homebrew tap

Install Ross Grattafiori's tools:

```sh
brew install rossgrat/tap/panopticon
brew install --cask rossgrat/tap/frontpair
```

[Panopticon](https://github.com/rossgrat/panopticon) finds and updates Git repositories.
[Frontpair](https://github.com/rossgrat/frontpair) shares hardware audio loopback as a call microphone.
Frontpair installs a CoreAudio driver with administrator access and restarts audio.

## Maintain

The [bump workflow](.github/workflows/bump.yml) updates formula URLs and checksums from tagged release archives and `checksums.txt`.
Run it manually or use:

```sh
scripts/bump.sh panopticon
```

To add a formula, publish darwin/linux archives for amd64/arm64, add its [Formula](Formula) file, and add it to the workflow matrix.
Versioned URLs supply the formula version.
Frontpair's package cask is outside this automation; update its version and SHA256 manually.
