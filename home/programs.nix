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

  # fancy replacement for ls
  eza = {
    enable = true;
    enableAliases = true;
    extraOptions = [ "--group-directories-first" "--header" ];
  };

  # fish shell
  fish = import ./fish.nix { inherit homeDirectory; };

  # git
  git = import ./git.nix;

  # home-manager
  home-manager = if pkgs.stdenv.isDarwin then { enable = false; } else { enable = true; };

  # starship prompt
  starship = import ./starship.nix;

  # enable vscode editor for darwin only
  vscode = if pkgs.stdenv.isDarwin then import ./vscode.nix { inherit pkgs; } else { enable = false; };
}
