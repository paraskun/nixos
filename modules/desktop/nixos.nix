{ pkgs, ... }:

{
  imports = [
    ./base.nix
  ];

  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    wofi
    wofi-power-menu
    wl-clipboard
    hyprpicker

    (blender.override { cudaSupport = true; })
  ];
}
