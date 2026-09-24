{ pkgs, ... }:

{
  imports = [
    ./services/openvpn
    ./services/syncthing
    ./services/gnupg
    ./services/notify

    ./programs/claude
    ./programs/desktop
    ./programs/browser
    ./programs/ghostty
    ./programs/git
    ./programs/tmux
  ];

  nixpkgs.config.allowUnfree = true;

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

    imports = [
      ./programs/nvim
      ./programs/zsh
      ./programs/mouseless
    ];
  };
}
