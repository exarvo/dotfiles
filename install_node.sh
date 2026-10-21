#!/usr/bin/env bash

set -e

brew install fnm

cat >> ~/.zshrc <<'EOF'

# Node (fnm)
eval "$(fnm env --use-on-cd --shell zsh)"
EOF

fnm install --lts
fnm default lts-latest
