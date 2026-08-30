{ pkgs, os, ... }:

{
  imports = [
    ./${os}.nix
  ];

  time.timeZone = "Asia/Novosibirsk";

  programs.zsh = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    inetutils
    dnsutils
    vim
    curl
    git
    pass
    btop
    socat
  ];
}
