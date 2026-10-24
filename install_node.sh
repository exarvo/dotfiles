#!/usr/bin/env bash

set -e

brew install fnm

grep -qxF "# Node (fnm)" ~/.zshrc || cat >> ~/.zshrc <<'EOT'

# Node (fnm)
eval "$(fnm env --use-on-cd --shell zsh)"
EOT

fnm install --lts
fnm default lts-latest || echo "Could not set the default Node. Run: fnm default <version>"
