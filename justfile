# Justfile to simplify NixOS commands
# Usage: just rebuild or just clean

# Rebuild system using flake
rebuild:
    sudo nixos-rebuild switch 

# Show what will be built (dry run)
dry-activate:
    sudo nixos-rebuild dry-activate

# Garbage collection (free up disk space)
clean:
    sudo nix-collect-garbage -d

# Remove all generations except current
clean-all:
    sudo nix-collect-garbage -d
    sudo nix-collect-garbage --delete-old

# Show system generations
generations:
    sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

# Switch to previous generation
boot-prev:
    sudo nix-env --rollback

# Default recipe
default: rebuild
