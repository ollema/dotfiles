{ pkgs, ... }:

{
  imports = [ ./shell.nix ./git.nix ];

  home.packages = with pkgs; [
    hub # git wrapper
    wget # download files
    fzf # fuzzy finder
    bat # fancy version of `cat`
    fd # fancy version of `find`
    exa # fancy version of `ls`
    htop # fancy version of `top`
    ripgrep # fancy version of `grep`
    duf # fancy version of `df`
    tealdeer # rust implementation of `tldr`
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
