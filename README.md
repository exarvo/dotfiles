# The DOTFILES

Bash scripts to set up a fresh Debian/Ubuntu machine: Homebrew, zsh with Oh My Zsh, vim, and a dev toolchain.

## Before you run (bare systems only)

Skip this on a normal Ubuntu install. On a minimal system (fresh Debian, VPS, Docker), install `sudo` and `git` once, as root:

```bash
apt update && apt install -y sudo git curl
adduser <your-user>              # only if you have no normal user yet
usermod -aG sudo <your-user>
su - <your-user>
```

This can't be part of `setup.sh`: it needs root, but `setup.sh` must not run as root (Homebrew refuses), and you need `git` to get this repo in the first place.

## Usage

As a normal user with `sudo`:

```bash
git clone https://github.com/exarvo/dotfiles.git
cd dotfiles
bash setup.sh
```

It ends by starting zsh in your terminal. The default shell change applies to new logins, so log out and back in once.

## Scripts

| Script | Does |
| --- | --- |
| `setup.sh` | Entry point: prerequisites, Homebrew, then the scripts below |
| `zsh.sh` | zsh as default shell, Oh My Zsh, autosuggestions, syntax-highlighting |
| `essentials.sh` | cmake, clang-format, clang-tidy, jq, ripgrep, fd, fzf, bat, gh, unzip |
| `install_vim.sh` | Vim, vim-plug, `vimrc` linked to `~/.vimrc`, vim as default editor |
| `install_go.sh` | Go, Hugo, `GOPATH`/`GOBIN` |
| `install_node.sh` | Node.js LTS via fnm |
| `install_python.sh` | Python via uv |
| `install_ffmpeg.sh` | ffmpeg |

## Notes

- Safe to re-run: installed tools are skipped and nothing is added to `~/.zshrc` twice.
- To skip a tool, remove its line from `setup.sh`.
- The tool scripts need brew on your `PATH`, so run them via `setup.sh` (or open a new zsh first).
- Toolchain relies heavily on homebrew for installation and management of the tools.
