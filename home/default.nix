{ pkgs, ... }:

{
  # ---------------------------------------------------------------------------
  # packages
  # ---------------------------------------------------------------------------
  home.packages = with pkgs; [
    # git
    hub # git wrapper

    # utils
    bat # fancy version of `cat`
    duf # fancy version of `df`
    exa # fancy version of `ls`
    fd # fancy version of `find`
    fzf # fuzzy finder
    htop # fancy version of `top`
    ripgrep # fancy version of `grep`
    tealdeer # rust implementation of `tldr`
  ];

  # ---------------------------------------------------------------------------
  # git
  # ---------------------------------------------------------------------------
  programs.git = {
    enable = true;
    userName = "Olle Månsson";
    userEmail = "31876997+ollema@users.noreply.github.com";

    ignores = [ ".DS_Store" ];

    aliases = { l = "log --pretty=oneline -n 50 --graph --abbrev-commit"; };

    extraConfig = {
      hub.protocol = "ssh";
      push.default = "current";
      init.defaultBranch = "main";
      pull.rebase = true;
      color.ui = true;
    };
  };

  # ---------------------------------------------------------------------------
  # shell
  # ---------------------------------------------------------------------------
  # fish shell
  programs.fish = {
    enable = true;

    shellAliases = {
      git = "hub";
      ls = "exa";
      cat = "bat";
      find = "fd";
      ll = "ls -la";
      tree = "exa --tree";
      reload = "exec fish";
    };

    shellAbbrs = {
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gcm = "git commit -m";
      gca = "git commit --amend";
      gac = "git add .; git commit --amend --no-edit";
      gp = "git push";
      gl = "git l";
      gd = "git diff";
      gf = "git fetch";
    };

    interactiveShellInit = "starship init fish | source";
    functions.fish_greeting = "";
  };

  # starship prompt
  programs.starship = {
    enable = true;
    settings = {
      format = "$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$line_break$python$character";

      directory = { style = "blue"; };

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
