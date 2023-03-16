# justfile for dotfiles

# rebuild system
rebuild:
  darwin-rebuild --flake . switch

# update flake
update:
  nix flake update

# format .nix files
format:
  nixpkgs-fmt .
