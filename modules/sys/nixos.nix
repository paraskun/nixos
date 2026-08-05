{ pkgs, inputs, ... }:

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

  security.pki.certificateFiles = [
    ../../certs/ltx-rca.crt
    ../../certs/ltx-ca.crt
  ];

  environment.systemPackages = with pkgs; [
    gcc

    # inputs.rftp.packages.${pkgs.system}.rftp
  ];
}
