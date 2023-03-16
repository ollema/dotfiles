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
    # icons = true; disable for now
  };

  # fish shell
  fish = import ./fish.nix { inherit homeDirectory; };

  # git
  git = import ./git.nix;

  # starship prompt
  starship = import ./starship.nix;

  # enable vscode editor for darwin only
  vscode = if pkgs.stdenv.isDarwin then import ./vscode.nix { inherit pkgs; } else { enable = false; };
}
