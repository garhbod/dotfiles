# dotfiles

My personal dotfiles managed with [Nix](https://nixos.org/), [Flox](https://flox.dev/), and [stow](https://www.gnu.org/software/stow/).

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

### 3. Install Nix packages

```sh
nix profile add ~/dotfiles
```

### 4. Install Flox

```sh
nix shell nixpkgs#flox -c flox --version
```

This will prompt you to set up Flox if it's your first time.

### 5. Activate the Flox environment

```sh
flox activate
```

This is done automatically in interactive fish shells via `config.fish`.

### 6. Symlink config files with stow

```sh
cd ~/dotfiles && stow .
```

The `.stowrc` in the repo sets the target to `~/` and ignores non-config files. Running from within the directory ensures `.stowrc` is read.

## Packages

### Nix profile

| Category | Packages |
|---|---|
| Shell & navigation | `fish`, `starship`, `zoxide`, `fzf`, `tmux` |
| Editors | `neovim`, `micro`, `nano` |
| File & text tools | `bat`, `ripgrep`, `jq`, `which` |
| Dev tools | `git`, `laravel`, `stow` |

### Flox environment

| Category | Packages |
|---|---|
| AI tools | `claude-code`, `codex`, `cursor-cli`, `gemini-cli`, `goose-cli`, `kilocode-cli` |

## Flox

The `.flox/` directory defines a Flox environment for AI CLI tools. It is activated automatically in interactive fish shells:

```fish
flox activate --dir ~ -m run | source
```

The environment is stowed to `~/` so the `flox activate` command resolves correctly from any directory.

## Caddy

To start Caddy with the included Caddyfile:

```sh
caddy run --config ~/dotfiles/caddy/Caddyfile
```

## Updating

### Nix

```sh
nix profile upgrade --all
```

### Flox

```sh
flox update
```

Restart your shell afterwards.

### 2. Clone the repo

```sh
nix run nixpkgs#git -- clone https://github.com/garhbod/dotfiles.git
```

This uses `nix run` to temporarily get `git` without permanently installing it.

### 3. Install packages

```sh
nix profile add ~/dotfiles
```

### 4. Symlink config files with stow

```sh
cd ~/dotfiles && stow .
```

The `.stowrc` in the repo sets the target to `~/` and ignores non-config files. Running from within the directory ensures `.stowrc` is read.

## Packages

Included packages:

| Category | Packages |
|---|---|
| Shell & navigation | `fish`, `starship`, `zoxide`, `fzf`, `tmux` |
| Editors | `neovim`, `micro`, `nano` |
| File & text tools | `bat`, `ripgrep`, `jq`, `which` |
| Dev tools | `git`, `laravel`, `stow` |
| AI tools | `claude-code`, `codex`, `gemini-cli`, `opencode` |

## Caddy

To start Caddy with the included Caddyfile:

```sh
caddy run --config ~/dotfiles/caddy/Caddyfile
```

## Updating

```sh
nix profile upgrade --all
```
