{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.karanthukral.common;
in {
  options = {
    karanthukral.common = {
      enable = mkEnableOption "Common configuration";
    };
  };

  config = mkIf cfg.enable {
    nix = {
      package = pkgs.nixUnstable;
      # nix options for derivations to persist garbage collection
      extraOptions = ''
        experimental-features = nix-command flakes
        keep-outputs = true
        keep-derivations = true
      '';

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };

    nixpkgs = {
      config.allowUnfree = true;
    };

    time.timeZone = "America/Toronto";

    boot = {
      cleanTmpDir = true;
      # kernel.sysctl = {
      #   "fs.inotify.max_user_watches" = "1048576";
      #   "net.ipv4.ip_forward" = "1";
      # };
    };

    security.sudo.wheelNeedsPassword = false;

    networking.firewall = {
      allowPing = true;
    };

    virtualisation = {
      docker.enable = true;
      # podman.enable = true;
    };

    # users.mutableUsers = false;

    environment.systemPackages = with pkgs; [
      curl
      vim
      dnsutils
      docker
      docker-compose
      file
      fzf
      gcc
      git
      gnumake
      gnupg
      htop
      inetutils
      jq
      mosh
      nix-index
      openssl
      patchelf
      tmux
      tree
      unzip
      wget
      zsh
      direnv
      nix-direnv
      kubectl
      doctl
      go
      gopls
    ];

    environment.pathsToLink = [
      "/share/nix-direnv"
    ];

    # if you also want support for flakes (this makes nix-direnv use the
    # unstable version of nix):
    nixpkgs.overlays = [
      (self: super: { nix-direnv = super.nix-direnv.override { enableFlakes = true; }; } )
    ];

    programs = {
      zsh.enable = true;
      mosh.enable = true;
    };
    services.openssh = {
      enable = true;
      passwordAuthentication = false;
    };
    services.cron = {
      enable = true;
    };
  };
}
