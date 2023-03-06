{
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
      features = "line-numbers";
      syntax-theme = "Visual Studio Dark+";
      navigate = true;
    };
  };
}
