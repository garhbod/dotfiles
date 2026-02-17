{
  description = "Universal Dotfiles Package Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      # The systems supported for this flake's outputs
      supportedSystems = [
        "x86_64-linux" # 64-bit Intel/AMD Linux
        "aarch64-linux" # 64-bit ARM Linux
        "x86_64-darwin" # 64-bit Intel macOS
        "aarch64-darwin" # 64-bit ARM macOS
      ];

      # Helper function to generate attributes for each system
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Function to instantiate nixpkgs for a given system
      nixpkgsFor = system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };in {
      # This generates packages for every system in supportedSystems
      packages = forAllSystems (system:
        let
          pkgs = nixpkgsFor system;
          
          # Category definitions
          cli = with pkgs; [
            bat
            fish
            fzf
            git
            jq
            # kanata
            # lazygit
            micro
            mise
            nano
            neovim
            ripgrep
            stow
            starship
            tmux
            which
            zoxide
          ];

          ai = with pkgs; [
          	claude-code
          	gemini-cli
          	opencode
          ];

          gui = with pkgs; [
            # alacritty
            # discord
            # firefox
          ];
        in {
          terminal = pkgs.buildEnv {
            name = "terminal-env";
            paths = cli ++ ai;
          };

          desktop = pkgs.buildEnv {
            name = "desktop-env";
            paths = cli ++ ai ++ gui;
          };

          # Set the default when you just run 'nix profile install .'
          default = self.packages.${system}.desktop;
        }
      );
    };
}
