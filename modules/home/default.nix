{ lib, config, pkgs, ... }:
with lib;
let
  keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAb1Orql8g/EFyvMomHgZ3FOdfyJGWsrSbvhaDM4Zj3s kthukral@digitalocean.com"
  ];
  cfg = config.kthukral.home;
in {
  options = {
    kthukal.home = {
      user = mkOption {
        type = types.str;
        default = "kt";
      };

      group = mkOption {
        type = types.str;
        default = "users";
      };

      includeDOVPN = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = {
    users.users = {
      "${cfg.user}" = {
        isNormalUser = true;
        home = "/home/${cfg.user}";
        description = "Karan Thukral";
        extraGroups = [ "wheel" "docker" ];
        shell = pkgs.zsh;
        openssh.authorizedKeys.keys = keys;
      };

      root = {
        openssh.authorizedKeys.keys = keys;
      };
    };

    # home-manager.users."${cfg.user}" = {
    #   home.file = {
    #     ".config" = {
    #       source = ../../dotfiles/.config;
    #       recursive = true;
    #     };

    #     ".gitconfig" = {
    #       source = (../../dotfiles/.gitconfig. + "${cfg.user}");
    #     };

    #     ".gitignore" = {
    #       source = ../../dotfiles/.gitignore;
    #     };

    #     "bin/do-vpn.sh" = mkIf cfg.includeDOVPN {
    #       source = ../../bin/do-vpn.sh;
    #     };
    #     "bin/hipreport.sh" = mkIf cfg.includeDOVPN {
    #       source = ../../bin/hipreport.sh;
    #     };
    #     "bin/ical2diary.fish" = {
    #       source = ../../bin/ical2diary.fish;
    #     };
    #   };
    # };
  };
}
