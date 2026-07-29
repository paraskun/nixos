{ ... }:

{
  imports = [
    ./base.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  virtualisation.docker = {
    enable = true;
  };
}
