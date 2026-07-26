{ config, lib, pkgs, hostName, ... }:

{
  users.users.paraskun = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
    ];
  };

  home-manager.users.paraskun = {
    imports = [
      (import ./programs/hypr.nix { inherit config lib pkgs hostName; })

      ./programs/nvim.nix
      ./programs/zsh.nix
    ];

    programs.home-manager.enable = true;

    home = {
      username = "paraskun";
      homeDirectory = "/home/paraskun";

      packages = with pkgs; [
        telegram-desktop
        opencode
      ];

      stateVersion = "26.05";
    };
  };
}
