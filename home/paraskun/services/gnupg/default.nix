{ pkgs, ... }:

{
  environment.etc."u2f_keys".text = ''
  paraskun:GCTH0vCxAj9WjJdJ9ofw4HMgCPHgZ5DSvL5s+Er6Beee687V0YK6m5AknzreXetgOacKlDjxY7YrC2wlYeatRg==,bnRopy2vo1LpbGLb3buANfOVymDjd5YkTzo12Jic2w7m5xFZ34zRVVCGuJ2TC1SdUasel64zS9f73IzI7jwaVQ==,es256,+presence   
  '';

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

  services.pcscd.enable = true;

  services.udev.extraRules = ''
    ACTION=="remove",\
      SUBSYSTEM=="usb",\
      ENV{DEVTYPE}=="usb_device",\
      ENV{PRODUCT}=="1050/407/*",\
      RUN+="${pkgs.systemd}/bin/systemctl start physlock.service"
  '';


  home-manager.users.paraskun = {
    programs.gpg = {
      enable = true;

      settings = {
        personal-cipher-preferences = "AES256 AES192 AES";
        personal-digest-preferences = "SHA512 SHA384 SHA256";
        personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
        cert-digest-algo = "SHA512";
        s2k-digest-algo = "SHA512";
        s2k-cipher-algo = "AES256";
        charset = "utf-8";
        no-comments = true;
        no-emit-version = true;
        no-greeting = true;
        with-fingerprint = true;
        require-cross-certification = true;
        require-secmem = true;
        no-symkey-cache = true;
        armor = true;
        use-agent = true;
        keyserver = "hkps://keys.openpgp.org";
      };
    };

    services.gpg-agent = {
      enable = true;

      enableSshSupport = true;
      pinentryPackege = pkgs.pinentry-curses;
      defaultCacheTtl = 60;
      maxCacheTtl = 300;
    };
  };
}
