{ lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    nameservers = [ "10.124.57.141" ];
    defaultGateway = "10.124.56.1";
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce false;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          { address="10.124.56.21"; prefixLength=21; }
        ];
        ipv4.routes = [ { address = "10.124.56.1"; prefixLength = 32; } ];
      };
      
    };
    search = [ "internal.digitalocean.com" "consul" ];
    firewall.enable = false;
    localCommands = ''
      ip=$(ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
      subnet=$(ip route | grep -Po '^\d+(.\d+){3}/\d+(?= dev eth0)')
      gateway=$(ip route | grep -Po '(?<=default via )[.\d]+')
      ip rule delete from $ip table 128 || true
      ip rule add from $ip table 128 || true
      ip route add table 128 to $subnet dev eth0 || true
      ip route add table 128 default via $gateway || true
    '';
  };
  services.udev.extraRules = ''
    ATTR{address}=="92:63:2e:26:bb:98", NAME="eth0"
    
  '';
}
