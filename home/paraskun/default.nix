{ pkgs, hostName, ... }:

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
      ./programs/nvim.nix
      ./programs/hypr.nix
    ];

    programs.home-manager.enable = true;

    home = {
      username = "paraskun";
      homeDirectory = "/home/paraskun";

      packages = with pkgs; [
        telegram-desktop
        opencode
      ];

      sessionVariables = {
        EDITOR = "nvim";
        BROWSER = "brave";
        TERMINAL = "ghostty";
      };

      stateVersion = "26.05";
    };
  };
}
