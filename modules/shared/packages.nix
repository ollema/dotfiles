{ pkgs }:

with pkgs; [
  alacritty
  coreutils
  curl
  du-dust
  fd
  ffmpeg
  fzf
  killall
  just
  jq
  neofetch
  ngrok
  ripgrep
  sqlite
  tree
  # tmux # TODO: move to home-manager
  wget
  zip
  unzip

  # -- encryption and security tools --
  age
  age-plugin-yubikey
  gnupg
  libfido2

  # -- git --
  delta
  git-review
  gh
  pre-commit

  # -- nix --
  nixpkgs-fmt

  # -- node --
  nodejs

  # -- python --
  python312
  uv
  ruff
]
