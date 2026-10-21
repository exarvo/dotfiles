# The DOTFILES

Bash scripts to set up a fresh Debian/Ubuntu machine: Homebrew, zsh with Oh My Zsh, and a dev toolchain.

## Usage

Run as a normal user with `sudo` access (not root):

```bash
git clone https://github.com/exarvo/dotfiles.git
cd dotfiles
chmod +x setup.sh
./setup.sh
```

Then log out and back in (or run `exec zsh`) to start using zsh.

## What's included

| Script | Installs |
| --- | --- |
| `setup.sh` | Entry point: apt prerequisites, Homebrew, then runs the scripts below |
| `zsh.sh` | zsh as the default shell, Oh My Zsh, autosuggestions and syntax-highlighting plugins |
| `essentials.sh` | cmake, jq, ripgrep, fd, fzf, bat, gh, unzip |
| `install_vim.sh` | Vim with vim-plug and plugins, `.vimrc` linked to `~/.vimrc`, `EDITOR`/`VISUAL` set to vim |
| `install_go.sh` | Go and Hugo, with `GOPATH` and `GOBIN` set |
| `install_node.sh` | Node.js LTS via fnm |
| `install_python.sh` | Python via uv |
| `install_ffmpeg.sh` | ffmpeg |

## Notes

- Meant for a fresh install. The scripts append to `~/.zshrc`, so running them twice duplicates those lines.
- The tool scripts rely on `setup.sh` having loaded Homebrew. To run one on its own, first run `eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"`.
- Debian/Ubuntu only (uses `apt`).
- Toolchain relies heavily on homebrew for installation and management of the tools.
