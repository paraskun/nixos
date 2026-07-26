{ config, pkgs, ... }:

{
  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };

  system.stateVersion = "26.05";
}
