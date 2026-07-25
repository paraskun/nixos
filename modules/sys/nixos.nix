{ pkgs, ... }:

{
  imports = [
    ./base.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  virtualisation.docker = {
    enable = true;
  };

  security.pki.certificateFiles = [
    ../../certs/ltx-rca.crt
    ../../certs/ltx-ca.crt
  ];

  services.physlock = {
    enable = true;

    lockOn = {
      suspend = true;
      hibernate = true;
    };

    muteKernelMessages = true;
  };

  environment.systemPackages = with pkgs; [
    gcc
  ];
}
