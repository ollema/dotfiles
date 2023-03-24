{ pkgs, ... }:

let
  font = "CaskaydiaCove Nerd Font Mono";
  terminalFont = "CaskaydiaCove Nerd Font Mono";
  colorTheme = "Dark+";
  iconTheme = "material-icon-theme";

  inherit (pkgs.vscode-utils) buildVscodeMarketplaceExtension;

  extension = { publisher, name, version, sha256 }:
    buildVscodeMarketplaceExtension { mktplcRef = { inherit name publisher sha256 version; }; };
in
{
  enable = true;
  # ----------------------------------------------------------------------------
  # extensions
  # ----------------------------------------------------------------------------
  mutableExtensionsDir = true;
  extensions = with pkgs.vscode-extensions; [
    b4dm4n.vscode-nixpkgs-fmt
    bbenoist.nix
    bradlc.vscode-tailwindcss
    esbenp.prettier-vscode
    github.copilot
    mkhl.direnv
    ms-python.python
    ms-python.vscode-pylance
    ms-vscode-remote.remote-ssh
    pkief.material-icon-theme
    skellock.just
    svelte.svelte-vscode
    timonwong.shellcheck
    tomoki1207.pdf
    tyriar.sort-lines
    usernamehw.errorlens

    (extension {
      publisher = "moalamri";
      name = "inline-fold";
      version = "0.2.3";
      sha256 = "sha256-7PiLC60KUVgRMlTaAjPCFmiEj4QiMgktzdr16PcDrQM=";
    })

    (extension {
      publisher = "ms-vscode-remote";
      name = "remote-containers";
      version = "0.283.0";
      sha256 = "sha256-LaZzDLfQHFaOnkvKzq0vmUvAi+Q6sJrJPlAhWX0fY40=";
    })
  ];

  userSettings = {
    # --------------------------------------------------------------------------
    # editor settings
    # --------------------------------------------------------------------------
    "editor.cursorBlinking" = "phase";
    "editor.detectIndentation" = false;
    "editor.fontFamily" = font;
    "editor.fontLigatures" = false;
    "editor.formatOnPaste" = false;
    "editor.formatOnSave" = true;
    "editor.inlineSuggest.enabled" = true;
    "editor.insertSpaces" = true;
    "editor.rulers" = [ ];
    "editor.tabSize" = 2;

    # --------------------------------------------------------------------------
    # explorer settings
    # --------------------------------------------------------------------------
    "explorer.excludeGitIgnore" = true;

    # --------------------------------------------------------------------------
    # files settings
    # --------------------------------------------------------------------------
    "files.trimTrailingWhitespace" = true;
    "files.insertFinalNewline" = true;

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
    "[nix]" = {
      "editor.defaultFormatter" = "B4dM4n.nixpkgs-fmt";
    };

    # --------------------------------------------------------------------------
    # python settings
    # --------------------------------------------------------------------------
    "[python]" = {
      "editor.tabSize" = 4;
    };
  };
}
