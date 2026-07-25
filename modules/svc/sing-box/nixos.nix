{ ... }:

{
  networking.firewall = {
    trustedInterfaces = [
      "throne-tun"
    ];
  };

  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };

  services.xray = {
    enable = false;

    settings = {
      inbounds = [
        {
          protocol = "socks";
          listen = "127.0.0.1";
          port = 2080;

          settings = {
            udp = true;
          };

          sniffing = {
            enabled = true;
            destOverride = [ "http" "tls" ];
          };
        }
      ];

      outbounds = [
        {
          protocol = "vless";
          tag = "proxy";

          settings = {
            vnext = [
              {
                address = "uk-global2.xeovo.net";
                port = 443;

                users = [
                  {
                    id = "3539de24-da5d-4ae3-9fa3-3daa92cdc75a";
                    encryption = "none";
                  }
                ];
              }
            ];
          };

          streamSettings = {
            network = "tcp";
            security = "tls";

            tlsSettings = {
              serverName = "uk-global2.xeovo.net";
              fingerprint = "chrome";
            };
          };
        }
      ];
    };
  };
}
