#!/usr/bin/env bash

set -e

# Install zsh
sudo apt install -y zsh

# Make zsh the default login shell for the current user
sudo chsh -s "$(command -v zsh)" "${USER:-$(id -un)}"

# Install Oh My Zsh (unattended: don't switch shell or launch zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Enable plugins (syntax-highlighting must be last)
sed -i 's/^plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
