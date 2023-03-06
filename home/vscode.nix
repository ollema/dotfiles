{ pkgs, ... }:

let
  font = "CaskaydiaCove Nerd Font Mono";
  terminalFont = "CaskaydiaCove Nerd Font Mono";
  colorTheme = "Visual Studio Dark+";
  iconTheme = "material-icon-theme";

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
    pkief.material-icon-theme
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
    "editor.fontFamily" = font;
    "editor.fontLigatures" = false;
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
    "terminal.integrated.fontFamily" = terminalFont;

    # --------------------------------------------------------------------------
    # workbench settings
    # --------------------------------------------------------------------------
    "workbench.colorTheme" = colorTheme;
    "workbench.iconTheme" = iconTheme;

    # --------------------------------------------------------------------------
    # nix settings
    # --------------------------------------------------------------------------
    "[nix]" = { "editor.defaultFormatter" = "brettm12345.nixfmt-vscode"; };
    "nixfmt.path" = "nixfmt -w 120";
  };
}
