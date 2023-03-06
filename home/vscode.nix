{ pkgs, ... }:

let
  # font = "CascadiaCode";
  font = "Iosevka";
  # colorTheme = "GitHub Dark Dimmed";
  # iconTheme = "material-icon-theme";

  inherit (pkgs.vscode-utils) buildVscodeMarketplaceExtension;

  extension = { publisher, name, version, sha256 }:
    buildVscodeMarketplaceExtension { mktplcRef = { inherit name publisher sha256 version; }; };
in {
  enable = true;
  # ----------------------------------------------------------------------------
  # extensions
  # ----------------------------------------------------------------------------
  mutableExtensionsDir = false;
  extensions = with pkgs.vscode-extensions; [
    bbenoist.nix
    bradlc.vscode-tailwindcss
    brettm12345.nixfmt-vscode
    esbenp.prettier-vscode
    github.copilot
    mkhl.direnv
    svelte.svelte-vscode
    timonwong.shellcheck
    tomoki1207.pdf
    tyriar.sort-lines
    usernamehw.errorlens
  ];

  userSettings = {
    # --------------------------------------------------------------------------
    # editor settings
    # --------------------------------------------------------------------------
    "editor.detectIndentation" = false;
    # "editor.fontFamily" = font;
    "editor.fontLigatures" = true;
    "editor.formatOnPaste" = false;
    "editor.formatOnSave" = true;
    "editor.inlineSuggest.enabled" = true;
    "editor.insertSpaces" = true;
    "editor.rulers" = [ 80 100 120 ];
    "editor.tabSize" = 2;

    # --------------------------------------------------------------------------
    # explorer settings
    # --------------------------------------------------------------------------
    "explorer.excludeGitIgnore" = true;

    # --------------------------------------------------------------------------
    # search settings
    # --------------------------------------------------------------------------
    "search.exclude" = {
      "**/.direnv" = true;
      "**/.git" = true;
      "**/node_modules" = true;
      "*.lock" = true;
    };

    # --------------------------------------------------------------------------
    # terminal settings
    # --------------------------------------------------------------------------
    "terminal.integrated.fontFamily" = font;

    # --------------------------------------------------------------------------
    # nix settings
    # --------------------------------------------------------------------------
    "[nix]" = { "editor.defaultFormatter" = "brettm12345.nixfmt-vscode"; };
    "nixfmt.path" = "nixfmt -w 120";
  };
}
