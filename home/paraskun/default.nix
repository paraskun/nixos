{ pkgs, ... }:

{
  imports = [
    ./services/openvpn
    ./services/syncthing
    ./services/zapret
    ./services/gnupg
    ./services/notify

    ./programs/claude
    ./programs/desktop
    ./programs/browser
    ./programs/ghostty
    ./programs/nvim
    ./programs/git
    ./programs/tmux
    ./programs/zsh
  ];

  home-manager.users.paraskun = {
    programs.home-manager.enable = true;

    home = {
      username = "paraskun";

      packages = with pkgs; [
        telegram-desktop
        opencode
      ];

      stateVersion = "26.05";
    };
  };
}
