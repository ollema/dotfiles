{ pkgs, lib, ... }:

{
  # configure user
  users.users.s0001325 = {
    home = "/Users/s0001325";
    shell = pkgs.fish; # this does not do very much it seems
  };

  # enable fish
  programs.fish.enable = true;
  
  # enable other shells
  programs.zsh.enable = true;
  programs.bash.enable = true;

  # configure /etc/shells to include fish
  environment.shells = [ pkgs.fish ];

  # set default shell to fish
  system.activationScripts.extraActivation.text = "chsh -s ${pkgs.fish}/bin/fish";

  # enable nix-daemon
  services.nix-daemon.enable = true;
  nix.useDaemon = true;
}
