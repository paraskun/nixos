{ pkgs, hostName, ... }:

{
  xdg.configFile = {
    "hypr/hyprland.lua".source = ../dotfiles/hypr/hyprland.lua;
    "hypr/host.lua".source = ../dotfiles/hypr/hosts/${hostName}.lua;
  };
}
