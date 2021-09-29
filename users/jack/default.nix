{ config, self, lib, pkgs, ... }:
let
  inherit (builtins) toFile readFile;
  inherit (lib) fileContents mkForce;

  name = "Jacek Kenig";
in
{

  imports = [
    ../../profiles/develop/common.nix
    ./graphical
    (lib.mkAliasOptionModule [ "jack" ] [ "home-manager" "users" "jack" ])
  ];

  age.secrets = {
    nixos.file = "${self}/secrets/secret.age";
    # root.file = "${self}/secrets/root.age";
    # jack.file = "${self}/secrets/jack.age";
    # github.file = "${self}/secrets/github.age";
    # github.owner = "jack";
    # gitlab.file = "${self}/secrets/gitlab.age";
    # gitlab.owner = "jack";
    # cargo.file = "${self}/secrets/cargo.age";
    # cargo.owner = "jack";
    # cachix.file = "${self}/secrets/cachix.age";
    # cachix.owner = "jack";
  };


  #users.users.jack.openssh.authorizedKeys.keyFiles = [ ./yubi.pub ];
  #users.users.root.openssh.authorizedKeys.keyFiles = [ ./yubi.pub ];

  #users.users.root.passwordFile = config.age.secrets.root.path;

  users.users.jack.packages = with pkgs; [ pandoc ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [ cachix ];
  #jack-logo

  jack = { lib, ... }: {
    imports = [ ../profiles/git ../profiles/alacritty ../profiles/direnv ];

    home = {
      activation.myActivationAction =
        lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          mkdir -p ~/{,.cargo,.ssh,.config/cachix}
        '';
    };

    # ln -sf ${config.age.secrets.cargo.path} ~/.cargo/credentials
    # ln -sf ${config.age.secrets.cachix.path} ~/.config/cachix/cachix.dhall

    # programs.go = {
    #   enable = true;
    #   goPath = "go";
    # };

    programs.mpv = {
      enable = true;
      config = {
        ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";
        hwdec = "auto";
        vo = "gpu";
      };
    };

    programs.git = {
      userName = name;
      userEmail = "hadesranger@gmail.com";
      # signing = {
      #   key = "8985725DB5B0C122";
      #   signByDefault = true;
      # };
      # includes = [{
      #   condition = "gitdir:~/work/";
      #   path = ./work.inc;
      # }];
    };

    programs.ssh = {
      enable = true;
      hashKnownHosts = true;

      matchBlocks = {
        github = {
          host = "github.com";
          identityFile = config.age.secrets.github.path;
          extraOptions = { AddKeysToAgent = "yes"; };
        };
        gitlab = {
          host = "gitlab.com";
          identityFile = config.age.secrets.gitlab.path;
          extraOptions = { AddKeysToAgent = "yes"; };
        };
      };
    };
  };

  users.groups.media.members = [ "jack" ];

  users.users.jack = {
    description = name;
    isNormalUser = true;
    hashedPassword = "$6$rU/gd7Dm/$dFxMqcDfAvuk5llGOK4lH7lMh5jH6/.SKSuYr8HQZrwBYorOIcn3hb8cEbOsyBbNb2MmWPqJP65.rbMkkfmex0";
    extraGroups = [ "wheel" "input" "networkmanager" "libvirtd" "adbusers" ];
  };
}
