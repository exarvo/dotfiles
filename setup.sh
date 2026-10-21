#!/usr/bin/env bash

set -e

# Run from the repo folder so the scripts below are found
cd "$(dirname "$0")"

# Install prerequisites (Debian/Ubuntu)
sudo apt update
sudo apt install -y build-essential procps curl file git

# Install Homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Load brew for this script and every script it runs
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install zsh and make it the default shell
# (must run before anything writes to ~/.zshrc, because Oh My Zsh creates it)
bash zsh.sh

# Add brew to PATH for future shells
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
