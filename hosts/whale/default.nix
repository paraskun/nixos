{ pkgs, hostName, ... }:

{
  imports = [
    ./hardware.nix

    ../../modules/sys/nixos.nix
    ../../modules/svc/ssh.nix
    ../../modules/svc/tailscale/nixos.nix
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
      ];
      shell = pkgs.zsh;
    };
  };

  networking.hostName = hostName;

  system.stateVersion = "26.05";
}
