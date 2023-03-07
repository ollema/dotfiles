{ homeDirectory, pkgs, ... }:

{
  # fancy cat replacement
  bat = {
    enable = true;
    config = {
      theme = "Visual Studio Dark+";
      paging = "never";
    };
  };

  # easy shell environments
  direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # fancy replacement for ls
  exa = {
    enable = true;
    enableAliases = true;
    icons = true;
  };

  # fish shell
  fish = import ./fish.nix { inherit homeDirectory; };

  # git
  git = import ./git.nix;

  # ssh TODO: fix this when secrets handling is done
  # ssh = {
  #   enable = true;
  #   matchBlocks = [
  #     {
  #       host = "hal";
  #       options = {
  #       };
  #     }
  #   ];
  # };

  # starship prompt
  starship = import ./starship.nix;

  # vscode editor
  vscode = import ./vscode.nix { inherit pkgs; };
}
