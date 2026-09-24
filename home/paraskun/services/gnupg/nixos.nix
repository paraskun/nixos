{ pkgs, ... }:

{
  environment.shellInit = ''
    gpg-connect-agent updatestartuptty /bye >/dev/null
  '';

  services.pcscd.enable = true;
  services.udev.packages = [ pkgs.yubikey-personalization ];

  security.pam = {
    u2f = {
      control = "sufficient";

      settings = {
        interactive = true;
        pinverification = 1;
        authfile = "/etc/u2f_keys";
        origin = "pam://panda";
      };
    };

    services = {
      login = {
        u2fAuth = true;
        unixAuth = true;
      };

      sudo = {
        u2fAuth = true;
        unixAuth = true;
      };
      
      physlock = {
        u2fAuth = true;
        unixAuth = true;
      };
    };
  };

  home-manager.users.paraskun = {
    services.gpg-agent = {
      pinentryPackage = pkgs.pinentry-curses;
    };
  };
}
