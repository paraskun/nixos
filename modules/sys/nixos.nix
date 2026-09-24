{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.nftables.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.firewall = {
    trustedInterfaces = [ "incusbr0" ];
  };

  networking.nat = {
    enable = true;
    internalInterfaces = [ "incurbr0" ];
    externalInterface = "enp9s0";
  };

  virtualisation = {
    docker = {
      enable = true;
    };

    incus = {
      enable = true;
    };
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

  services.udev.extraRules = ''
  KERNEL=="uinput", GROUP="uinput", MODE="0660"
  '';

  environment.systemPackages = with pkgs; [
    gcc
  ];
}
