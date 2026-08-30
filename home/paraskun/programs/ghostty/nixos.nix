{ pkgs, ... }:

{
  home-manager.users.paraskun = {
    home.packages = with pkgs; [
      monaspace
    ];

    programs.ghostty = {
      enable = true;

      settings = {
        font-family = "Monaspace Neon";
        font-size = 11;
        foreground = "AAAAAA";
        background = "101010";
        app-notifications = "no-clipboard-copy";
      };
    };
  };
}
