{ agenix, config, pkgs, ... }:

let user = "s0001325"; in

{
  imports = [
    ../../modules/darwin/secrets.nix
    ../../modules/darwin/home-manager.nix
    ../../modules/shared
    ../../modules/shared/cachix
    agenix.darwinModules.default
  ];

  # auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # setup user, packages, programs
  nix = {
    package = pkgs.nixUnstable;
    settings.trusted-users = [ "@admin" "${user}" ];

    gc = {
      user = "root";
      automatic = true;
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
      options = "--delete-older-than 30d";
    };

    # turn this on to make command line easier
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # turn off NIX_PATH warnings now that we're using flakes
  system.checks.verifyNixPath = false;

  # load configuration that is shared across systems
  environment.systemPackages = with pkgs; [
    agenix.packages."${pkgs.system}".default
  ] ++ (import ../../modules/shared/packages.nix { inherit pkgs; });

  # enable fonts dir
  fonts.fontDir.enable = true;

  system = {
    stateVersion = 4;

    defaults = {
      NSGlobalDomain = {
        # disable automatic capitalization as it's annoying when writing code
        NSAutomaticCapitalizationEnabled = false;

        # disable smart dashes as they’re annoying when writing code
        NSAutomaticDashSubstitutionEnabled = false;

        # disable automatic period substitution as it’s annoying when writing code
        NSAutomaticPeriodSubstitutionEnabled = false;

        # disable smart quotes as they’re annoying when writing code
        NSAutomaticQuoteSubstitutionEnabled = false;

        # disable auto-correct
        NSAutomaticSpellingCorrectionEnabled = false;

        # show all filename extensions
        AppleShowAllExtensions = true;

        # disable press-and-hold for keys in favor of key repeat
        ApplePressAndHoldEnabled = false;

        # set a blazingly fast keyboard repeat rate
        KeyRepeat = 2;

        # set a shorter delay until key repeat
        InitialKeyRepeat = 15;

        # enable trackpad tap to click
        "com.apple.mouse.tapBehavior" = 1;

        # disable beeps
        "com.apple.sound.beep.volume" = 0.0;
        "com.apple.sound.beep.feedback" = 0;
      };

      dock = {
        # automatically hide and show the dock
        autohide = true;

        # don't show recent applications in the dock
        show-recents = false;

        # enable launch animation
        launchanim = true;

        # set dock orientation to bottom
        orientation = "bottom";

        # set dock size (default is 64)
        tilesize = 48;
      };

      finder = {
        _FXShowPosixPathInTitle = false;
      };

      trackpad = {
        Clicking = true;
      };
    };
  };
}
