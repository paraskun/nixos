{ pkgs, ... }:

{
  home.packages = with pkgs; [
    monaspace
  ];

  programs.ghostty = {
    enable = true;

    settings = {
      font-family = "Monaspace Neon";
      font-size = 12;
      foreground = "AAAAAA";
      background = "101010";
    };
  };
}
