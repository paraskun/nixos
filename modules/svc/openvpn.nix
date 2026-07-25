{
  services.openvpn.servers = {
    ltx = {
      config = '' config /root/nixos/openvpn/ltx.conf '';
      updateResolvConf = true;
    };
  };
}
