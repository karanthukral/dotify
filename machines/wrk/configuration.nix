{ lib, config, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
  ];

  kthukral = {
    common.enable = true
    home = {
      "kthukral"
    };
  };

  environment.systemPackages = with pkgs; [
    fly
    vault
  ];

  networking.hostName = "nix-test";
}
