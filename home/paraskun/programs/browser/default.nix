{ pkgs, ... }:

{
  home-manager.users.paraskun = {
    programs.chromium = {
      enable = true;
      package = pkgs.google-chrome;
    };
  };
}
