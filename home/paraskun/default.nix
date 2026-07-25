{ pkgs, ... }:

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
    programs.home-manager.enable = true;

    home = {
      username = "paraskun";
      homeDirectory = "/home/paraskun";

      packages = with pkgs; [
        telegram-desktop
        neovim
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
