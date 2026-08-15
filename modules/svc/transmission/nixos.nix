{ ... }:

{
  services.transmission = {
    enable = true;
    
    settings = {
      download-dir = "/srv/transmission";
    };
  };
}
