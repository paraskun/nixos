{ ... }:

{
  home-manager.users.paraskun = {
    services.mako = {
      enable = true;
      defaultTimeout = 5000;
      anchor = "top-left";
      width = 300;
      height = 100;
    };
  };
}
