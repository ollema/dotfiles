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
    ffmpeg # what can it not to?
    fd # fancy version of `find`
    fzf # fuzzy finder
    glow # markdown viewer
    htop # another fancy version of `top`
    httpie # http client
    hyperfine # benchmarking tool
    imagemagick # convert bitmap images
    just # task runner
    jq # json parser
    ngrok # tunnel
    procs # fancy version of `ps`
    ripgrep # fancy version of `grep`
    tealdeer # rust implementation of `tldr`
  ];

  gitTools = with pkgs; [
    delta # git diff viewer
    git-review # git review tool
    pre-commit # git pre-commit hook manager
  ];

  jsTools = with pkgs; [
    nodejs # node (currently node 18)
    nodePackages.pnpm # node package manager
  ];

  nixTools = with pkgs; [
    nixpkgs-fmt # nix formatter
  ];

  pythonTools = with pkgs; [
    black # formatter
    ruff # linter
  ];
in
bin
++ utils
++ gitTools
++ jsTools
++ nixTools
++ pythonTools
++ (lib.optionals pkgs.stdenv.isDarwin darwinSpecific)
