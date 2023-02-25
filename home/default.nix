{ pkgs, ... }:

{
  # ---------------------------------------------------------------------------
  # packages
  # ---------------------------------------------------------------------------
  home.packages = with pkgs; [
    hub # git wrapper
    wget # download files
    fzf # fuzzy finder
    bat # fancy version of `cat`
    fd # fancy version of `find`
    exa # fancy version of `ls`
    htop # fancy version of `top`
    ripgrep # fancy version of `grep`
    duf # fancy version of `df`
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
  # starship prompt
  programs.starship = { enable = true; };

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
      gac = "git add .; git commit --amend";
      gp = "git push";
      gl = "git l";
      gd = "git diff";
      gf = "git fetch";
    };

    interactiveShellInit = "starship init fish | source";

    functions.fish_greeting = "";
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
