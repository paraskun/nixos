{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix

    ../../modules/sys/base.nix
    ../../modules/sys/throne.nix
    ../../modules/desktop/hyprland.nix
    ../../modules/svc/ssh.nix
    ../../modules/svc/openvpn.nix

    (import ../../home/paraskun { inherit config lib pkgs; hostName = "panda"; })
  ];

  networking.hostName = "panda";

  system.stateVersion = "26.05";
}
