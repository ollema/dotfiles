{
  enable = true;
  onActivation.autoUpdate = true;
  onActivation.upgrade = true;
  onActivation.cleanup = "zap";
  # homebrew casks to install
  casks = [
    "autodesk-fusion360"
    "bitwarden"
    "discord"
    "firefox"
    "google-chrome"
    "guitar-pro"
    "raycast"
    "rectangle"
    "spotify"
  ];
  # mac app store apps to install
  masApps = { "GarageBand" = 682658836; };
}
