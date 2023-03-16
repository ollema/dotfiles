{ homeDirectory, username, ... }:
{ pkgs, ... }:

{
  # configure user
  users.users.${username} = {
    home = homeDirectory;
    shell = pkgs.fish; # this does not do very much it seems
  };

  # TODO: why is this needed here as well as in home-manager?
  programs.fish.enable = true;

  # configure /etc/shells to include fish so that chsh -s works
  environment.shells = [ pkgs.fish ];

  # silence shell welcome with .hushlogin and set default shell to fish.
  # TODO: think this is needed because users.users.${username}.shell
  # does not do actually change the login shell of (existing?) users
  system.activationScripts.extraActivation.text = "touch ${homeDirectory}/.hushlogin && chsh -s ${pkgs.fish}/bin/fish;";

  # TODO: why do I want the daemon? are both of theese needed?
  services.nix-daemon.enable = true;
  nix.useDaemon = true;

  # TODO: remove this once https://github.com/NixOS/nix/issues/7273 is fixed
  nix.settings.auto-optimise-store = false;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # TODO: why is this needed here and in flake.nix?
  nixpkgs.config.allowUnfree = true;

  # enable sudo with TouchID
  security.pam.enableSudoTouchIdAuth = true;

  # configure system.defaults
  system.defaults = import ./macos.nix;

  # homebrew packages
  homebrew = import ./homebrew.nix;
}
