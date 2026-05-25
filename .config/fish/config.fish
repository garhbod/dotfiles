# --- Nix environment (works everywhere) ---
if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
    source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
end

# Optional: user profile (sometimes needed depending on install)
if test -e $HOME/.nix-profile/etc/profile.d/nix.fish
    source $HOME/.nix-profile/etc/profile.d/nix.fish
end

# --- Interactive-only stuff ---
if status is-interactive
    # Commands to run in interactive sessions can go here
    # prompt, aliases, etc.
    
    # Initialise Starship
    starship init fish | source

    # Initialise Flox default env
    flox activate --dir ~ -m run | source
end
