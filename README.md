# zanmato/homebrew-tap

[Homebrew](https://brew.sh) casks for [Blanco](https://github.com/zanmato/blanco), [Broquest](https://github.com/zanmato/broquest) and [Shouting Robin](https://github.com/zanmato/shouting-robin).

## Install

```bash
brew install --cask zanmato/tap/blanco
brew install --cask zanmato/tap/broquest
brew install --cask zanmato/tap/shouting-robin
```

## Upgrade

All apps update themselves. You can also upgrade through Homebrew:

```bash
brew upgrade --cask blanco broquest shouting-robin
```

## Uninstall

```bash
brew uninstall --cask broquest
```

Add `--zap` to also remove the app data in `~/Library/Application Support`.

The casks are updated automatically by the release workflow of each app.
