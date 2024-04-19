{ user, ... }:

{
  enable = true;
  plugins = with pkgs.tmuxPlugins; [
    sensible
    yank
    prefix-highlight
    {
      plugin = resurrect; # Used by tmux-continuum

      # Use XDG data directory
      # https://github.com/tmux-plugins/tmux-resurrect/issues/348
      extraConfig = ''
        set -g @resurrect-dir '/Users/${user}/.cache/tmux/resurrect'
        set -g @resurrect-capture-pane-contents 'on'
        set -g @resurrect-pane-contents-area 'visible'
      '';
    }
    {
      plugin = continuum;
      extraConfig = ''
        set -g @continuum-restore 'on'
        set -g @continuum-save-interval '5' # minutes
      '';
    }
  ];
  terminal = "screen-256color";
#   prefix = "C-x";
  escapeTime = 10;
  historyLimit = 50000;
  extraConfig = ''
    # remove Vim mode delays
    set -g focus-events on

    # enable full mouse support
    set -g mouse on

    # -----------------------------------------------------------------------------
    # key bindings
    # -----------------------------------------------------------------------------

    # Unbind default keys
    # unbind C-b
    unbind '"'
    unbind %

    # Split panes, vertical or horizontal
    # bind-key x split-window -v
    # bind-key v split-window -h
  '';
}
