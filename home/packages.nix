{ pkgs, ... }:

with pkgs;
[
  # git
  delta # git diff viewer
  git-review # git review tool

  # utils
  bottom # fancy version of `top`
  choose # cut alternative
  dog # fancy version of `dig`
  duf # fancy version of `df`
  fd # fancy version of `find`
  fzf # fuzzy finder
  glow # markdown viewer
  htop # another fancy version of `top`
  httpie # http client
  hyperfine # benchmarking tool
  just # task runner
  jq # json parser
  procs # fancy version of `ps`
  ripgrep # fancy version of `grep`
  tealdeer # rust implementation of `tldr`

  # terminal
  iterm2

  # nix things
  nixfmt
] ++ (with pkgs.nerdfonts; [ (override { fonts = [ "CascadiaCode" "FiraCode" "Iosevka" ]; }) ])
