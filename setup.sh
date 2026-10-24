#!/usr/bin/env bash

# Run as a normal user with sudo:  bash setup.sh
# On a bare system (no sudo/git), see "Before you run" in README.md.
set -e

cd "$(dirname "$0")"

# Prerequisites (Debian/Ubuntu)
sudo apt-get update
sudo apt-get install -y build-essential procps curl file git ca-certificates

# Homebrew (skipped if already installed)
BREW=/home/linuxbrew/.linuxbrew/bin/brew
if [ ! -x "$BREW" ]; then
  sudo -v
  installer="$(mktemp)"
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o "$installer"
  NONINTERACTIVE=1 /bin/bash "$installer"
  rm -f "$installer"
fi
eval "$("$BREW" shellenv)"

# zsh (creates ~/.zshrc, so it must run before anything appends to it)
bash zsh.sh

# Add brew to PATH (once)
line='eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
touch ~/.bashrc ~/.zshrc
grep -qxF "$line" ~/.bashrc || echo "$line" >> ~/.bashrc
grep -qxF "$line" ~/.zshrc  || echo "$line" >> ~/.zshrc

# Tools
bash essentials.sh
bash install_vim.sh
bash install_go.sh
bash install_node.sh
bash install_python.sh
bash install_ffmpeg.sh

# Switch this terminal to zsh (only when run from a terminal)
if [ -t 0 ]; then
  exec zsh -l
fi
