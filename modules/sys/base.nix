{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Novosibirsk";

  networking.networkmanager.enable = true;

  programs.gnupg.agent = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    tmux
    curl
    git
    pass
  ];

  virtualisation.docker = {
    enable = true;
  };

  system.stateVersion = "26.05";
}
