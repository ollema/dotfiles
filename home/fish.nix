{ homeDirectory, ... }:

{
  enable = true;

  shellAliases = {
    cat = "bat --paging=never";
    find = "fd";
    # ls, ll, lha... are set by exa in ./programs.nix
    reload = "exec fish";

    dlos-server = "ssh -t dlos-server 'tmux -CC new -A -s main'";
    dlod-server = "ssh -t dlod-server 'tmux -CC new -A -s main'";
    hal = "ssh -t hal 'tmux -CC new -A -s main'";
    hal-data = "ssh -t hal-data 'tmux -CC new -A -s main'";
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
    gf = "git fetch";

    tfn = "tail -f -n100";
  };

  functions.fish_greeting = "";

  interactiveShellInit = ''
    # load environment variables from ${homeDirectory}/.env
    if test -f ${homeDirectory}/.env
      source ${homeDirectory}/.env
    end

    # load iterm2 shell integration
    if test -f ${homeDirectory}/.iterm2_shell_integration.fish
      source ${homeDirectory}/.iterm2_shell_integration.fish
    end

    # disable direnv prompt
    set -gx DIRENV_LOG_FORMAT ""
  '';
}
