{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;  

  # ---------------------------------------------------------------------------
  # packages
  # ---------------------------------------------------------------------------
  home.packages = with pkgs; [
    # git
    delta # git diff viewer

    # utils
    bottom # fancy version of `top`
    choose # cut alternative
    dog # fancy version of `dig`
    duf # fancy version of `df`
    exa # fancy version of `ls`
    fd # fancy version of `find`
    fzf # fuzzy finder
    glow # markdown viewer
    htop # another fancy version of `top`
    httpie # http client
    hyperfine # benchmarking tool
    just # task runner
    jq # json parser
    procs # fancy version of `ps`
    ripgrep # fancy version of `grep`
    tealdeer # rust implementation of `tldr`

    # terminal
    iterm2

    # nix things
    nixfmt
  ];

  programs.vscode = import ./vscode.nix { inherit pkgs; };
  
  # ---------------------------------------------------------------------------
  # bat
  # ---------------------------------------------------------------------------
  programs.bat = {
    enable = true;
    config = {
      theme = "Visual Studio Dark+";
      paging = "never";
    };
  };

  # ---------------------------------------------------------------------------
  # git
  # ---------------------------------------------------------------------------
  programs.git = {
    enable = true;
    userName = "Olle Månsson";
    userEmail = "31876997+ollema@users.noreply.github.com";

    ignores = [ ".DS_Store" ];

    aliases = {
      l =
        "log --pretty=format:'%C(auto,bold)%h %C(auto,reset)-%C(auto)%d %<|(100,trunc)%C(auto,reset)%s %>(20,trunc)%C(auto,dim)%cr - %aN'";
    };

    extraConfig = {
      push.default = "current";
      init.defaultBranch = "main";
      pull.rebase = true;
      color.ui = true;

      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";

      delta = {
        features = "side-by-side line-numbers";
        syntax-theme = "Visual Studio Dark+";
        navigate = true;
      };
    };
  };

  # TODO: do this when secrets handling is done
  # ---------------------------------------------------------------------------
  # ssh
  # ---------------------------------------------------------------------------
  # programs.ssh = {
  #   enable = true;
  #   matchBlocks = [
  #     {
  #       host = "hal";
  #       options = {

  #       };
  #     }
  #   ];
  # };

  # ---------------------------------------------------------------------------
  # shell
  # ---------------------------------------------------------------------------
  # fish shell
  programs.fish = {
    enable = true;

    shellAliases = {
      cat = "bat --paging=never";
      find = "fd";
      ls = "exa";
      ll = "ls -la";
      tree = "exa --tree";
      reload = "exec fish";

      dlos-server = "ssh -t dlos-server 'tmux -CC new -A -s main'";
      dlod-server = "ssh -t dlod-server 'tmux -CC new -A -s main'";
      hal = "ssh -t hal 'tmux -CC new -A -s main'";
      hal-data = "ssh -t hal-data 'tmux -CC new -A -s main'";
    };

    shellAbbrs = {
      gs = "git status -sb";
      ga = "git add .";
      gc = "git commit";
      gcm = "git commit -m";
      gca = "git commit --amend";
      gac = "git add .; git commit --amend --no-edit";
      gp = "git push";
      gl = "git l";
      gd = "git diff";
      gf = "git fetch";
    };

    functions.fish_greeting = "";
  };
  
  # other shells
  programs.zsh.enable = true;
  programs.bash.enable = true;

  # starship prompt
  programs.starship = {
    enable = true;
    settings = {
      format = "$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$line_break$python$character";

      directory = {
        style = "blue";
        truncate_to_repo = false;
      };

      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };

      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };

      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
        style = "cyan";
        conflicted = "​";
        untracked = "​";
        modified = "​";
        staged = "​";
        renamed = "​";
        deleted = "​";
        stashed = "≡";
      };

      git_state = {
        format = "([$state( $progress_current/$progress_total)]($style)) ";
        style = "bright-black";
      };

      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
      };

      python = {
        format = "[$virtualenv]($style) ";
        style = "bright-black";
      };
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
