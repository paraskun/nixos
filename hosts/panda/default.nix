{ pkgs, config, hostName, ... }:

{
  imports = [
    ./hardware.nix

    ../../modules/sys
    ../../modules/desktop

    ../../modules/svc/ssh
    ../../modules/svc/tailscale
    ../../modules/svc/sing-box
    ../../modules/svc/transmission

    ../../home/paraskun
  ];

  users.users = {
    paraskun = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "docker"
        "incus-admin"
        "rftp"
        "transmission"
        "input"
        "uinput"
      ];
      shell = pkgs.zsh;
    };
  };

  networking.hostName = hostName;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.uinput.enable = true;

  environment.sessionVariables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    QT_QPA_PLATFORM = "wayland;xcb";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  system.stateVersion = "26.05";
}
