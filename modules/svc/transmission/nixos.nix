{ ... }:

let
  dir = "/srv/transmission";
in
{
  services.transmission = {
    enable = true;
    
    settings = {
      download-dir = dir;
    };
  };

  systemd.tmpfiles.rules = [
    "d ${dir} 0750 transmission transmission - -"
  ];
}
