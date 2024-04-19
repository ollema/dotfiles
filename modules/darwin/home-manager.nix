{ config, pkgs, lib, home-manager, ... }:

let
  user = "s0001325";
  sharedFiles = import ../shared/files.nix { inherit config pkgs; };
in
{
  imports = [
    ./dock
  ];

  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.fish;
  };

  system.activationScripts.extraActivation.text = "touch /Users/${user}/.hushlogin";

  homebrew = {
    enable = true;
    casks = pkgs.callPackage ./casks.nix { };
    masApps = { };
  };

  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }: {
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix { };
        file = lib.mkMerge [
          sharedFiles
        ];

        stateVersion = "23.11";
      };
      programs = { } // import ../shared/home-manager.nix { inherit config pkgs lib; };

      manual.manpages.enable = false;
    };
  };

  # fully declarative dock
  local = {
    dock = {
      enable = true;
      entries = [
        { path = "/Applications/Arc.app"; }
        { path = "${pkgs.alacritty}/Applications/Alacritty.app/"; }
        { path = "/Applications/Visual\ Studio\ Code.app/"; }
        { path = "/System/Applications/Messages.app/"; }
        { path = "/System/Applications/Facetime.app/"; }
        { path = "/Applications/Slack.app/"; }
        { path = "/Applications/Spotify.app/"; }
        { path = "/Applications/Microsoft\ Teams\ (work\ or\ school).app"; }
      ];
    };
  };
}
