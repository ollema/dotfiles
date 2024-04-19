{ config, pkgs, lib, ... }:

let name = "Olle Månsson";
    user = "s0001325";
    email = "31876997+ollema@users.noreply.github.com"; in
{
  # shared shell configuration
  fish = {
    enable = true;

    shellAliases = {
      cat = "bat --paging=never";
      find = "fd";
      # ls, ll, lha... are set by eza in ./programs.nix
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
      gsw = "git switch";
    };
  };

  git = {
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
  };

  alacritty = {
    enable = true;
    settings = {
    shell.program = "${pkgs.fish}/bin/fish";
    };
  };

  ssh = {
    enable = true;

    extraConfig = lib.mkMerge [
      ''
        Host github.com
          Hostname github.com
          IdentitiesOnly yes
      ''
      # (lib.mkIf pkgs.stdenv.hostPlatform.isLinux
      #   ''
      #     IdentityFile /home/${user}/.ssh/id_github
      #   '')
      # (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin
      #   ''
      #     IdentityFile /Users/${user}/.ssh/id_github
      #   '')
    ];
  };
}
