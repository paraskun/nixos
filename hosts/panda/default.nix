{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Novosibirsk";

  networking.hostName = "panda";
  networking.networkmanager.enable = true;

  services.openssh.enable = true;

  programs.hyprland = {
    enable = true;
  };
  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };
  programs.gunpg.agent = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    tmux
    curl
    git
    ghostty
    brave
    wofi
    pass
    wl-clipboard
  ];

  users.users.paraskun = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      telegram-desktop
      neovim
    ]
  };

  system.stateVersion = "26.05";
}
