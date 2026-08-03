{ pkgs, ... }:

{
  home-manager.users.user = {
    imports = [
      ./programs/nvim.nix
      ./programs/zsh.nix
      ./programs/git.nix
    ];

    programs.home-manager.enable = true;

    home = {
      username = "user";
      homeDirectory = "/home/user";

      packages = with pkgs; [
        ripgrep
      ];

      stateVersion = "26.05";
    };
  };
}
