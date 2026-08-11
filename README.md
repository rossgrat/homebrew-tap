# homebrew-tap

Homebrew tap for my tools.

```sh
brew install rossgrat/tap/panopticon
```

Or add the tap once and install by bare name from then on:

```sh
brew tap rossgrat/tap
brew trust rossgrat/tap      # Homebrew 6+ gates third-party taps
brew install panopticon
```

## Formulae

| Formula | What it does |
| --- | --- |
| [`panopticon`](https://github.com/rossgrat/panopticon) | Find every git repo on your machine and pull it |

## How a formula stays current

Each tool's own repo publishes release archives plus a `checksums.txt` on every
`v*` tag. [`bump.yml`](.github/workflows/bump.yml) reads that release and
rewrites the formula's URLs and checksums — nightly, or on demand from the
Actions tab. Homebrew infers the version from the URL, so there is no version
line to keep in sync. It only needs the tap's own `GITHUB_TOKEN`, so there is no
cross-repo credential to rotate.

To bump by hand:

```sh
scripts/bump.sh panopticon
```

## Adding a tool

1. Give the tool a tag-triggered release workflow that publishes
   `<tool>_<tag>_<os>_<arch>.tar.gz` for darwin/linux × amd64/arm64 plus
   `checksums.txt`.
2. Write `Formula/<tool>.rb` with the four `url`/`sha256` pairs — any values;
   the bump script overwrites them.
3. Add the tool to the matrix in `bump.yml` and run `scripts/bump.sh <tool>`.
