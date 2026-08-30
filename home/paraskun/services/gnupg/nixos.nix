{ pkgs, ... }:

{
  environment.shellInit = ''
    gpg-connect-agent updatestartuptty /bye
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

  services.gpg-agent = {
    pinentryPackage = pkgs.pinentry-curses;
  };

  services.udev.extraRules = ''
    ACTION=="remove",\
      SUBSYSTEM=="usb",\
      ENV{DEVTYPE}=="usb_device",\
      ENV{PRODUCT}=="1050/407/*",\
      RUN+="${pkgs.systemd}/bin/systemctl start physlock.service"
  '';
}
