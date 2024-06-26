{ config, pkgs, lib, ... }:

let
  name = "Olle Månsson";
  user = "s0001325";
in
{
  # cat replacement
  bat = import ./programs/bat.nix;

  # ls replacement
  eza = import ./programs/eza.nix;

  # fish shell
  fish = import ./programs/fish.nix;

  # git
  git = import ./programs/git.nix { inherit name; };

  # starship prompt
  starship = import ./programs/starship.nix;

  # ssh
  ssh = import ./programs/ssh.nix { inherit lib; };
}
