{
  # ----------------------------------------------------------------------------
  # general ui/ux
  # ----------------------------------------------------------------------------
  # expand save panel by default
  NSGlobalDomain.NSNavPanelExpandedStateForSaveMode = true;
  NSGlobalDomain.NSNavPanelExpandedStateForSaveMode2 = true;

  # expand print panel by default
  NSGlobalDomain.PMPrintingExpandedStateForPrint = true;
  NSGlobalDomain.PMPrintingExpandedStateForPrint2 = true;

  # save to disk (not to iCloud) by default
  NSGlobalDomain.NSDocumentSaveNewDocumentsToCloud = true;

  # ----------------------------------------------------------------------------
  # mouse and keyboard
  # ----------------------------------------------------------------------------
  # disable automatic capitalization as it’s annoying when typing code
  NSGlobalDomain.NSAutomaticCapitalizationEnabled = false;

  # disable smart dashes as they’re annoying when typing code
  NSGlobalDomain.NSAutomaticDashSubstitutionEnabled = false;

  # disable automatic period substitution as it’s annoying when typing code
  NSGlobalDomain.NSAutomaticPeriodSubstitutionEnabled = false;

  # disable smart quotes as they’re annoying when typing code
  NSGlobalDomain.NSAutomaticQuoteSubstitutionEnabled = false;

  # disable auto-correct
  NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;

  # enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
  NSGlobalDomain.AppleKeyboardUIMode = 3;

  # disable press-and-hold for keys in favor of key repeat
  NSGlobalDomain.ApplePressAndHoldEnabled = false;

  # set a blazingly fast keyboard repeat rate
  NSGlobalDomain.InitialKeyRepeat = 15;
  NSGlobalDomain.KeyRepeat = 6;

  # enable trackpad tap to click
  NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;

  # ----------------------------------------------------------------------------
  # dock
  # ----------------------------------------------------------------------------
  # automatically hide and show the dock
  dock.autohide = true;
  # don't show recent applications in the dock
  dock.show-recents = false;
  # set dock tilesize (default is 64)
  dock.tilesize = 32;

  # ----------------------------------------------------------------------------
  # finder
  # ----------------------------------------------------------------------------
  # hide desktop icons
  finder.CreateDesktop = false;
  # enable quitting finder via ⌘ + Q (doing so will also hide desktop icons)
  finder.QuitMenuItem = true;
  # show path bar
  finder.ShowPathbar = true;
}
