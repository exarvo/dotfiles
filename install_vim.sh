#!/usr/bin/env bash

set -e

brew install vim

# Link the repo's vimrc to ~/.vimrc
ln -sf "$(dirname "$(realpath "$0")")/.vimrc" ~/.vimrc

# Install vim-plug, then the plugins from vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -es -u ~/.vimrc -i NONE -c PlugInstall -c qa

# Make vim the default editor
cat >> ~/.zshrc <<'EOF'

# Editor
export EDITOR=vim
export VISUAL=vim
alias vi=vim
EOF
