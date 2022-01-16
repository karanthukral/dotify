{ lib, config, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
  ];

  karanthukral = {
    common.enable = true;
    home = {
      user = "kthukral";
    };
  };

  environment.systemPackages = with pkgs; [
    fly
    vault
  ];

  networking.hostName = "nix-test";
}
