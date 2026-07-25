{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    ghostty
    brave
    wofi
    wl-clipboard
  ];
}
