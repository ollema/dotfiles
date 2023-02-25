{ pkgs, lib, ... }:

{
  users.users.s0001325 = {
    home = "/Users/s0001325";
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
  programs.zsh.enable = true;

  # are these needed?
  services.nix-daemon.enable = true;
  nix.useDaemon = true;
}
