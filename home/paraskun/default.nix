{ pkgs, os, ... }:

{
  imports = [
    ./services/openvpn/${os}.nix
    ./services/syncthing/${os}.nix
    ./programs/throne/${os}.nix
  ];

  home-manager.users.paraskun = {
    imports = [
      ./programs/hypr.nix
      ./programs/ghostty.nix
      ./programs/nvim.nix
      ./programs/zsh.nix
      ./programs/git.nix
      ./programs/tmux.nix
    ];

    programs.home-manager.enable = true;

    home = {
      username = "paraskun";

      packages = with pkgs; [
        telegram-desktop
        opencode
        lazygit
      ];

      stateVersion = "26.05";
    };
  };
}
