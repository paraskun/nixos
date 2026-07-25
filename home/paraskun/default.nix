{ pkgs, os, ... }:

{
  imports = [
    ./services/openvpn/${os}.nix
    ./services/syncthing/${os}.nix
    ./services/zapret/${os}.nix
  ];

  environment.etc."u2f_keys".text = ''
  paraskun:GCTH0vCxAj9WjJdJ9ofw4HMgCPHgZ5DSvL5s+Er6Beee687V0YK6m5AknzreXetgOacKlDjxY7YrC2wlYeatRg==,bnRopy2vo1LpbGLb3buANfOVymDjd5YkTzo12Jic2w7m5xFZ34zRVVCGuJ2TC1SdUasel64zS9f73IzI7jwaVQ==,es256,+presence   
  '';

  security.pam = {
    u2f = {
      control = "sufficient";

      settings = {
        cue = true;
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
        unixAuth = false;
      };
      
      physlock = {
        u2fAuth = true;
        unixAuth = false;
      };
    };
  };

  services.udev.extraRules = ''
    ACTION=="remove",\
      SUBSYSTEM=="usb",\
      ENV{DEVTYPE}=="usb_device",\
      ENV{PRODUCT}=="1050/407/*",\
      RUN+="${pkgs.systemd}/bin/systemctl start physlock.service"

    ACTION=="add",\
      SUBSYSTEM=="usb",\
      ENV{DEVTYPE}=="usb_device",\
      ENV{PRODUCT}=="1050/407/*",\
      RUN+="${pkgs.systemd}/bin/systemd-cat -t udev-test echo 'Add'"
  '';

  home-manager.users.paraskun = {
    imports = [
      ./programs/hypr.nix
      ./programs/ghostty.nix
      ./programs/nvim.nix
      ./programs/zsh.nix
      ./programs/git.nix
      ./programs/tmux.nix
    ];

    programs.home-manager.enable = true;

    home = {
      username = "paraskun";

      packages = with pkgs; [
        telegram-desktop
        opencode
        lazygit
        blender
      ];

      stateVersion = "26.05";
    };
  };
}
