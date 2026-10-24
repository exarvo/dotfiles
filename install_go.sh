#!/usr/bin/env bash

set -e

brew install go hugo

grep -qxF "# Go" ~/.zshrc || cat >> ~/.zshrc <<'EOT'

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
EOT
