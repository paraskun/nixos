{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.rftp;

  configFile = pkgs.writeText "rftp-server.conf" ''
    RFTP_DIRECTORY=${cfg.directory}
    RFTP_PORT=${toString cfg.port}
    RFTP_MAX_CLIENTS=${toString cfg.maxClients}
    RFTP_LOG_FILEPATH=/var/log/rftp-server.log
    RFTP_IS_LOG_ENABLE=0
    RFTP_TIMEOUT_S=${toString cfg.timeout}
  '';
in {
  options.services.rftp = {
    enable = mkEnableOption "Rapid FTP server";

    package = mkOption {
      type = types.package;
      default = pkgs.callPackage ./package.nix {};
    };

    user = mkOption {
      type = types.str;
      default = "rftp";
    };

    port = mkOption {
      type = types.port;
      default = 1069;
    };

    directory = mkOption {
      type = types.path;
      default = "/srv/rftp";
    };

    maxClients = mkOption {
      type = types.int;
      default = 5;
    };

    log.enable = mkOption {
      type = types.bool;
      default = true;
    };

    log.file = mkOption {
      type = types.path;
      default = "/var/log/rftp-server.log";
    };

    timeout = mkOption {
      type = types.int;
      default = 1;
    };
  };

  config = mkIf cfg.enable {
    users.groups.rftp = {};

    users.users.${cfg.user} = {
      isSystemUser = true;
      home = cfg.directory;
      createHome = true;
      group = "rftp";
    };

    systemd.tmpfiles.rules = [
      "z ${cfg.directory} 0770 ${cfg.user} rftp - -"
    ];

    systemd.services.rftp = {
      description = "Rapid FTP server";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "simple";
        User = cfg.user;
        Group = "rftp";
        WorkingDirectory = cfg.directory;
        Restart = "on-failure";
        RestartSec = "3s";
        StandardOutput = "journal";
        StandardError = "journal";
      };

      script = ''
        exec ${cfg.package}/bin/rftp-server ${configFile}
      '';
    };
  };
}
