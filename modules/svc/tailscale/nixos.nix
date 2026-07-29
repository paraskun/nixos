{ config, ... }:

{
  imports = [
    ./base.nix
  ];

  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;

    trustedInterfaces = [ config.services.tailscale.interfaceName ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };

  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];
}
