#!/usr/bin/env bash

set -e

brew install uv
uv python install

grep -qxF "# Python (uv tools install here)" ~/.zshrc || cat >> ~/.zshrc <<'EOT'

# Python (uv tools install here)
export PATH="$HOME/.local/bin:$PATH"
EOT
