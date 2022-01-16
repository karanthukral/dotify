{ lib, config, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
    (fetchTarball {
      url = "https://github.com/msteen/nixos-vscode-server/tarball/master";
      sha256 = "sha256:00aqwrr6bgvkz9bminval7waxjamb792c0bz894ap8ciqawkdgxp";
    })
  ];

  services.vscode-server.enable = true;

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
