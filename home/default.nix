{ homeDirectory, pkgs, stateVersion, system, username, ... }:

let
  # packages loaded into $PATH
  packages = import ./packages.nix { inherit pkgs; };
in {
  # enable font configuration (fonts are still installed in ./packages.nix)
  fonts.fontconfig.enable = true;

  # basic home-manager configuration
  home = { inherit homeDirectory packages stateVersion username; };

  # packages loaded into $PATH but configured by home-manager
  programs = import ./programs.nix { inherit pkgs; };
}
