{ pkgs, hostName, ... }:

{
  imports = [
    ../../modules/sys
    ../../modules/svc/ssh
    ../../modules/svc/tailscale
    ../../modules/desktop

    ../../home/paraskun
  ];

  nixpkgs.config.allowUnfree = true;

  users.users = {
    paraskun = {
      home = "/Users/paraskun";
      shell = pkgs.zsh;
    };
  };

  networking.hostName = hostName;

  system.primaryUser = "paraskun";
  system.stateVersion = 7;
}
