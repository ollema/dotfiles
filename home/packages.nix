{ lib, pkgs, ... }:

let
  bin = import ./bin.nix { inherit pkgs; };

  darwinSpecific = with pkgs; [
    # terminal
    iterm2 # terminal emulator of choice
    # messaging
    element-desktop # matrix client
    # additionnal python installation
    python312 # python 3.12
  ] ++ (with pkgs.nerdfonts; [ (override { fonts = [ "CascadiaCode" "FiraCode" "Iosevka" ]; }) ]);

  utils = with pkgs; [
    # utils
    bottom # fancy version of `top`
    choose # cut alternative
    dogdns # fancy version of `dig`
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
  ];

  gitTools = with pkgs; [
    delta # git diff viewer
    git-review # git review tool
  ];

  nixTools = with pkgs; [
    nixpkgs-fmt # nix formatter
  ];
in
bin
++ gitTools
++ utils
++ nixTools
++ (lib.optionals pkgs.stdenv.isDarwin darwinSpecific)
