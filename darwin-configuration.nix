{ pkgs, lib, ... }:

{
  users.users.s0001325 = {
    home = "/Users/s0001325";
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
  programs.zsh.enable = true;

  environment.shells = [ pkgs.fish ];

  # are these needed?
  services.nix-daemon.enable = true;
  nix.useDaemon = true;
}
