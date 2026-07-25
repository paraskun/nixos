{ pkgs, config, hostName, ... }:

{
  imports = [
    ./hardware.nix

    ../../modules/sys/nixos.nix
    ../../modules/svc/ssh.nix
    # ../../modules/svc/rftp/nixos.nix
    ../../modules/svc/tailscale/nixos.nix
    ../../modules/svc/sing-box/nixos.nix
    ../../modules/desktop/nixos.nix

    ../../home/paraskun
  ];

  users.users = {
    paraskun = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "docker"
        "rftp"
      ];
      shell = pkgs.zsh;
    };
  };

  networking.hostName = hostName;

  # hardware.graphics.enable = true;
  # services.xserver.videoDrivers = [ "nvidia" ];

  # hardware.nvidia = {
  #   open = true;
  #   modesetting.enable = true;
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };

  # environment.sessionVariables = {
  #   GBM_BACKEND = "nvidia-drm";
  #   __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  #   LIBVA_DRIVER_NAME = "nvidia";
  # };

  # boot.initrd.kernelModules = [
  #   "nvidia"
  #   "nvidia_modeset"
  #   "nvidia_drm"
  #   "nvidia_uvm"
  # ];

  system.stateVersion = "26.05";
}
