{ config, pkgs, ... }:

let
  shellAliases = {
    git = "hub";
    ls = "exa";
    cat = "bat";
    find = "fd";
    ll = "ls -la";
    tree = "exa --tree";
    reload = "exec fish";
  };

  shellAbbrs = {
    gs = "git status -sb";
    ga = "git add";
    gc = "git commit";
    gcm = "git commit -m";
    gca = "git commit --amend";
    gcl = "git clone";
    gco = "git checkout";
    gp = "git push";
    gpl = "git pull";
    gl = "git l";
    gd = "git diff";
    gds = "git diff --staged";
    gr = "git rebase -i HEAD~15";
    gf = "git fetch";
  };
in {
  # starship prompt
  programs.starship = { enable = true; };

  # fish shell
  programs.fish = {
    inherit shellAliases shellAbbrs;
    enable = true;
    interactiveShellInit = "starship init fish | source";
  };

  # zsh shell
  programs.zsh = {
    inherit shellAliases;
    enable = true;
    interactiveShellInit = "starship init zsh | source";
  };
}
