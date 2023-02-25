{ config, pkgs, ... }:

{
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
}
