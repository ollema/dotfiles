{ name, email, ... }:

{
  enable = true;
  ignores = [ "*.swp" ];
  userName = name;
  userEmail = email;

  aliases = {
    l =
      "log --pretty=format:'%C(auto,bold)%h %C(auto,reset)-%C(auto)%d %<|(100,trunc)%C(auto,reset)%s %>(20,trunc)%C(auto,dim)%cr - %aN'";
  };

  extraConfig = {
    push.default = "current";
    pull.rebase = true;
    init.defaultBranch = "main";
    # commit.gpgsign = true; # TODO
    color.ui = true;

    core = {
      editor = "nano";
    };

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
