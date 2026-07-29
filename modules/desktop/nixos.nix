{ pkgs, ... }:

{
  imports = [
    ./base.nix
  ];

  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    ghostty
    wofi
    wl-clipboard
  ];
}
