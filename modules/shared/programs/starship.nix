{
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

    cmd_duration = {
      format = "[$duration]($style) ";
      style = "yellow";
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

    hostname = {
      format = "[@$hostname]($style) ";
      style = "bright-black";
    };

    python = {
      format = "[$virtualenv]($style) ";
      style = "bright-black";
    };

    username = {
      format = "[$user]($style)";
      style_user = "bright-black";
    };
  };
}