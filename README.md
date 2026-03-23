# dotfiles

My personal dotfiles managed with [Nix](https://nixos.org/) and [stow](https://www.gnu.org/software/stow/).

## Install

### 1. Install Nix

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

Restart your shell afterwards.

### 2. Clone the repo

```sh
nix run nixpkgs#git -- clone https://github.com/garhbod/dotfiles.git
```

This uses `nix run` to temporarily get `git` without permanently installing it.

### 3. Install packages

```sh
nix profile add ./dotfiles
```

If you are on a terminal-only system with no GUI, use the `terminal` profile instead:

```sh
nix profile add ./dotfiles#terminal
```

### 4. Symlink config files with stow

```sh
stow -d dotfiles .
```

The `.stowrc` in the repo sets the target to `~/` automatically, so this will symlink everything in `.config/` and other dotfiles into your home directory.

## Packages

Both profiles share the following packages:

| Category | Packages |
|---|---|
| Shell & navigation | `fish`, `starship`, `zoxide`, `fzf`, `tmux` |
| Editors | `neovim`, `micro`, `nano` |
| File & text tools | `bat`, `ripgrep`, `jq`, `which` |
| Dev tools | `git`, `mise`, `stow` |
| AI tools | `claude-code`, `gemini-cli`, `opencode` |

The default `desktop` profile extends `terminal` with additional GUI applications.

## Updating

```sh
nix profile upgrade '.*'
```
