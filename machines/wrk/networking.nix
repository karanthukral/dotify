{ lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    nameservers = [ "8.8.8.8"
 ];
    defaultGateway = "157.245.112.1";
    defaultGateway6 = "";
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce false;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          { address="157.245.113.188"; prefixLength=20; }
{ address="10.17.0.5"; prefixLength=16; }
        ];
        ipv4.routes = [ { address = "157.245.112.1"; prefixLength = 32; } ];
      };

    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="46:49:f7:31:f3:d6", NAME="eth0"
    ATTR{address}=="66:72:f3:97:22:15", NAME="eth1"
  '';
}
