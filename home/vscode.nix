{ pkgs, ... }:

let
  font = "CaskaydiaCove Nerd Font Mono";
  terminalFont = "CaskaydiaCove Nerd Font Mono";
  colorTheme = "Default Dark Modern";
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
    dbaeumer.vscode-eslint
    github.copilot
    mkhl.direnv
    ms-azuretools.vscode-docker
    ms-python.python
    ms-python.vscode-pylance
    ms-vscode.makefile-tools
    ms-vscode-remote.remote-ssh
    pkief.material-icon-theme
    rust-lang.rust-analyzer
    skellock.just
    svelte.svelte-vscode
    timonwong.shellcheck
    tomoki1207.pdf
    tyriar.sort-lines
    usernamehw.errorlens
    waderyan.gitblame

    (extension {
      publisher = "moalamri";
      name = "inline-fold";
      version = "0.2.4";
      sha256 = "sha256-oi/RjtnwallpOIzPwuoA22BjuBrKQMWSIBL+1KHTXq8=";
    })

    (extension {
      publisher = "ms-vscode-remote";
      name = "remote-containers";
      version = "0.293.0";
      sha256 = "sha256-O0hM+GKZ46moihBlPvfNuqfLazR5WVqEaE6XiEnaNN0=";
    })

    (extension {
      publisher = "charliermarsh";
      name = "ruff";
      version = "2023.17.11351528";
      sha256 = "sha256-ZM9iyQCI3hdVj2w2wxXUYTZp8b9XmfTsft5MuGwEF98=";
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
    # json settings
    # --------------------------------------------------------------------------
    "[json]" = {
      "editor.defaultFormatter" = "vscode.json-language-features";
    };

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
      # standard tab size for python
      "editor.tabSize" = 4;
      # fix problems with ruff on save but use isort for sorting imports
      "editor.codeActionsOnSave" = {
        "source.fixAll" = true;
        "source.organizeImports" = true;
      };
    };
    # configure black
    "python.formatting.provider" = "black";
    "python.formatting.blackArgs" = [ "--line-length=100" ];
    "python.formatting.blackPath" = "${pkgs.black}/bin/black";
    # configure ruff
    "ruff.path" = [ "${pkgs.ruff}/bin/ruff" ];
    "ruff.organizeImports" = false;

    # --------------------------------------------------------------------------
    # rust settings
    # --------------------------------------------------------------------------
    "[rust]" = {
      "editor.defaultFormatter" = "rust-lang.rust-analyzer";
    };

    # --------------------------------------------------------------------------
    # svelte settings
    # --------------------------------------------------------------------------
    "svelte.enable-ts-plugin" = true;
    "[svelte]" =
      {
        "editor.defaultFormatter" = "svelte.svelte-vscode";
      };

    # --------------------------------------------------------------------------
    # typescript settings
    # --------------------------------------------------------------------------
    "[typescript]" = {
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
    };
  };
}
