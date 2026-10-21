#!/usr/bin/env bash

set -e

brew install uv
uv python install

cat >> ~/.zshrc <<'EOF'

# Python (uv tools install executables here)
export PATH="$HOME/.local/bin:$PATH"
EOF
