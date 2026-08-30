{ ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";

    extraConfig = ''
      bind-key -n M-i previous-window
      bind-key -n M-o next-window

      bind-key -n M-h select-pane -L
      bind-key -n M-l select-pane -R
      bind-key -n M-k select-pane -U
      bind-key -n M-j select-pane -D

      set -g set-clipboard on
      set -g allow-passthrough on
    '';
  };
}
