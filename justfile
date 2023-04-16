# justfile for dotfiles

# set configuration manager command based on operating system
configuration_manager_command := if os() == "macos" { "darwin-rebuild" } else { "home-manager" }

# build new configuration
build:
  {{ configuration_manager_command }} build --flake .

# build and switch to new configuration
switch:
  {{ configuration_manager_command }} switch --flake .

# update flake
update:
  nix flake update

# format .nix files
format:
  nixpkgs-fmt .

# clean up and garbage collect nix store
clean:
  nix-collect-garbage -d
