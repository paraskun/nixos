{ pkgs, os, ... }:

{
  imports = [
    ./${os}.nix
  ];

  home-manager.users.paraskun = {
    home.packages = with pkgs; [
      monaspace
    ];

    xdg.configFile."ghostty" = {
      source = ../../dotfiles/ghostty;
    };
  };
}
