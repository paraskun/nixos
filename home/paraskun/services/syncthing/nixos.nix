{ config, ... }:

{
  services.syncthing = {
    enable = true;
    user = "paraskun";
    dataDir = "${config.users.users.paraskun.home}/.syncthing";
    openDefaultPorts = true;

    overrideDevices = true;
    overrideFolders = true;

    settings = {
      devices = {
        "squirrel" = {
          id = "D4WQVPP-AHLV6B3-TEUZKHT-I5TP4TE-MZA5AUT-ZXDWZFM-XDCWGW2-DZ3O5AI";
          addresses = [
            "tcp://100.100.154.120:22000"
          ];
        };
      };

      folders = {
        "vault" = {
          path = "${config.users.users.paraskun.home}/vault";
          devices = [ "squirrel" ];
        };
      };
    };
  };
}
