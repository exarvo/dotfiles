#!/usr/bin/env bash

set -e

brew install go hugo

cat >> ~/.zshrc <<'EOF'

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
EOF
