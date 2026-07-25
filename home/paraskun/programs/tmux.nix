{ ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";

    extraConfig = ''
      bind-key -n M-j previous-window
      bind-key -n M-k next-window

      set -g set-clipboard on
      set -g allow-passthrough on
    '';
  };
}
