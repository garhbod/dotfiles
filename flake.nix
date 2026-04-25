{
  description = "Universal Dotfiles Package Flake";

  nixConfig = {
    extra-trusted-substituters = [ "https://cache.flox.dev" ];
    extra-trusted-public-keys = [ "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs=" ];
  };

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable-small";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      nixpkgsFor = system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      packages = forAllSystems (system:
        let
          pkgs = nixpkgsFor system;

          cli = with pkgs; [
            bat
            caddy
            fish
            fzf
            gh
            git
            jq
            # kanata
            laravel
            # lazygit
            micro
            nano
            neovim
            ripgrep
            starship
            stow
            # tailscale
            tmux
            which
            zoxide
          ];

          ai = with pkgs; [
            claude-code
            codex
            cursor-cli
            gemini-cli
            opencode
          ];
        in {
          default = pkgs.buildEnv {
            name = "terminal-env";
            paths = cli;
          };
          ai = pkgs.buildEnv {
            name = "ai-env";
            paths = ai;
          };
        }
      );
    };
}
