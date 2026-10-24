#!/usr/bin/env bash

set -e

brew install vim

# Link vimrc from this repo (an existing real ~/.vimrc is kept as ~/.vimrc.bak)
[ -f ~/.vimrc ] && [ ! -L ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.bak
ln -sf "$(dirname "$(realpath "$0")")/.vimrc" ~/.vimrc

# vim-plug and plugins
curl -fsSLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -es -u ~/.vimrc -i NONE -c PlugInstall -c qa

# Default editor (added once)
grep -qxF "# Editor" ~/.zshrc || cat >> ~/.zshrc <<'EOT'

# Editor
export EDITOR=vim
export VISUAL=vim
alias vi=vim
EOT
