{ ... }:

{
  services.transmission = {
    enable = true;
    
    settings = {
      download-dir = "/var/lib/transmission/downloads";
    };
  };
}
