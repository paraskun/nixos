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
    "z ${dir} 0730 root users - -"
  ];
}
