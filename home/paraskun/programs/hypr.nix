{ pkgs, hostName, ... }:

{
  xdg.configFile = {
    "hypr/hyprland.lua".source = ../dotfiles/hypr/hyprland.lua;
    "hypr/host.lua".source = ../dotfiles/hypr/hosts/${hostName}.lua;
  };

  home.pointerCursor = {
    enable = true;
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
    hyprcursor.enable = true;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Adwaita";
  };
}
