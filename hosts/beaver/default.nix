{ pkgs, hostName, ... }:

{
  imports = [
    ../../modules/sys/macos.nix
    ../../modules/svc/ssh.nix
    ../../modules/svc/tailscale/macos.nix
    ../../modules/desktop/macos.nix

    ../../home/paraskun
  ];

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
