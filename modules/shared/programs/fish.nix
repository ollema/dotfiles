{
  enable = true;

  shellAliases = {
    cat = "bat --paging=never";
    find = "fd";
    reload = "exec fish";
  };

  shellAbbrs = {
    gs = "git status";
    ga = "git add .";
    gc = "git commit";
    gcm = "git commit -m";
    gca = "git commit --amend";
    gac = "git add .; git commit --amend --no-edit";
    gp = "git push";
    gl = "git l";
    gd = "git diff";
    gf = "git fetch --all";
  };

  functions.fish_greeting = "";
}
