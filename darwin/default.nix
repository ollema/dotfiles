{ pkgs, ... }:

{
  # configure user
  users.users.s0001325 = {
    home = "/Users/s0001325";
    shell = pkgs.fish; # this does not do very much it seems
  };

  # TODO: why is this needed here as well as in home-manager?
  programs.fish.enable = true;

  # configure /etc/shells to include fish so that chsh -s works
  environment.shells = [ pkgs.fish ];

  # set default shell to fish.
  # TODO: think this is needed because users.users.s0001325.shell 
  # does not do actually change the login shell of (existing?) users
  system.activationScripts.extraActivation.text = "chsh -s ${pkgs.fish}/bin/fish";

  # TODO: why do I want the daemon? are both of theese needed?
  services.nix-daemon.enable = true;
  nix.useDaemon = true;

  # TODO: remove this once https://github.com/NixOS/nix/issues/7273 is fixed
  nix.settings.auto-optimise-store = false;

  # TODO: why is this needed here and in flake.nix?
  nixpkgs.config.allowUnfree = true;

  # configure system.defaults
  system.defaults = import ./macos.nix;

  # homebrew packages
  homebrew = {
    enable = true;
    onActivation.upgrade = true;
    casks = [ "autodesk-fusion360" "discord" "guitar-pro" "raycast" "rectangle" ];
  };
}
