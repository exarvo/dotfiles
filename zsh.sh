#!/usr/bin/env bash

set -e

command -v zsh >/dev/null || sudo apt-get install -y zsh

# Default shell: applies at next login. A failure here shouldn't stop the setup.
chsh -s "$(command -v zsh)" "${USER:-$(id -un)}" \
  || echo "Could not change the default shell. Run later: chsh -s $(command -v zsh)"

# Oh My Zsh (skipped if already installed)
if [ ! -d ~/.oh-my-zsh ]; then
  installer="$(mktemp)"
  curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o "$installer"
  sh "$installer" --unattended
  rm -f "$installer"
fi

for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
  [ -d ~/.oh-my-zsh/custom/plugins/$plugin ] || git clone https://github.com/zsh-users/$plugin ~/.oh-my-zsh/custom/plugins/$plugin
done

sed -i 's/^plugins=(git)$/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
