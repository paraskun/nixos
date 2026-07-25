{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix

    ../../modules/sys/base.nix
    ../../modules/desktop/hyprland.nix
    ../../modules/svc/ssh.nix

    ../../home/paraskun
  ];

  networking.hostName = "panda";

  system.stateVersion = "26.05";
}
