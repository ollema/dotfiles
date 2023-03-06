{ pkgs, ... }:

{
  # enable font configuration (fonts are still installed in ./packages.nix)
  fonts.fontconfig.enable = true;

  home = {
    # packages loaded into $PATH
    packages = import ./packages.nix { inherit pkgs; };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "22.11";
  };

  # packages loaded into $PATH but configured by home-manager
  programs = import ./programs.nix { inherit pkgs; };
}
