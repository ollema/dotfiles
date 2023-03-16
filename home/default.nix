{ homeDirectory, pkgs, stateVersion, username, ... }:
{ lib, ... }:

let
  # packages loaded into $PATH
  packages = import ./packages.nix { inherit lib pkgs; };
in
{
  # enable font configuration for darwin only (fonts are still installed in ./packages.nix)
  fonts.fontconfig.enable = if pkgs.stdenv.isDarwin then true else false;

  # basic home-manager configuration
  home = { inherit homeDirectory packages stateVersion username; };

  # packages loaded into $PATH but configured by home-manager
  programs = import ./programs.nix { inherit homeDirectory pkgs; };
}
