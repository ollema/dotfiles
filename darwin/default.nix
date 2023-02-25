{ pkgs, lib, ... }:

{
  users.users.s0001325 = {
    home = "/Users/s0001325";
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
  programs.zsh.enable = true;

  # configure /etc/shells
  environment.shells = [ pkgs.fish ];

  system.activationScripts.extraActivation.text = ''
    # set default shell to fish
    chsh -s ${pkgs.fish}/bin/fish
  '';

  # are these needed?
  services.nix-daemon.enable = true;
  nix.useDaemon = true;
}
