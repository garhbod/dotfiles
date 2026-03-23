# dotfiles

My personal dotfiles managed with [Nix](https://nixos.org/) and [stow](https://www.gnu.org/software/stow/).

## Install

### 1. Install Nix

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Restart your shell afterwards.

### 2. Clone and install packages

```sh
nix run nixpkgs#git -- clone https://github.com/garhbod/dotfiles.git && nix profile add ./dotfiles
```

This uses `nix run` to temporarily get `git` for cloning, then installs the default (`desktop`) profile from the local flake — no prior tooling required.

If you are on a terminal-only system with no GUI, use the `terminal` profile instead:

```sh
nix run nixpkgs#git -- clone https://github.com/garhbod/dotfiles.git && nix profile add ./dotfiles#terminal
```

### 3. Symlink config files with stow

```sh
stow -d dotfiles .
```

The `.stowrc` in the repo sets the target to `~/` automatically, so this will symlink everything in `.config/` and other dotfiles into your home directory.

## Packages

The `terminal` profile includes:

| Category | Packages |
|---|---|
| Shell & navigation | `fish`, `starship`, `zoxide`, `fzf`, `tmux` |
| Editors | `neovim`, `micro`, `nano` |
| File & text tools | `bat`, `ripgrep`, `jq`, `which` |
| Dev tools | `git`, `mise`, `stow` |
| AI tools | `claude-code`, `gemini-cli`, `opencode` |

## Updating

```sh
nix profile upgrade '.*'
```
