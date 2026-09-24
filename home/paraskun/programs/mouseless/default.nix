{ pkgs, ... }:

{
  xdg.configFile."mouseless" = {
    source = ../../dotfiles/mouseless;
  };

  systemd.user.services.mouseless = {
    Service = {
      ExecStart = "${pkgs.mouseless}/bin/mouseless";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
