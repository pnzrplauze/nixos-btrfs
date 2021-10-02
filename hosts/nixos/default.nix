{ self, lib, modulesPath, pkgs, suites, hardware, ... }:

{
  imports = lib.flatten suites.mobile ++
    [
      ./hardware.nix
    ];


  i18n.defaultLocale = "pl_PL.UTF-8";
  time.timeZone = "Europe/Warsaw";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "btrfs" ];
  services.fstrim.enable = true;
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/home" "/root" ];
  };
  services.snapper = {
    snapshotInterval = "hourly";
    cleanupInterval = "1d";
    configs = {
      home = {
        subvolume = "/home";
        extraConfig = ''
          ALLOW_USERS="jack"
          TIMELINE_CREATE=yes
          TIMELINE_CLEANUP=yes
        '';
      };
      root = {
        subvolume = "/root";
        extraConfig = ''
          ALLOW_USERS="root"
          TIMELINE_CREATE=yes
          TIMELINE_CLEANUP=yes
        '';
      };
    };
  };

  environment.systemPackages = with pkgs; [
    xorg.setxkbmap
    xorg.xset
    brightnessctl
  ];

  services.redshift.enable = true;
  location = {
    latitude = 52.237049;
    longitude = 21.017532;
  };

  nix.maxJobs = lib.mkDefault 16;

  services.xserver.videoDrivers = [ "amd" ];

  services.picom = {
    backend = "glx";
    vSync = true;
  };

  security.mitigations.acceptRisk = true;

  # networking.useDHCP = false;

  # services.udev.extraRules = ''
  #   SUBSYSTEM=="usb", ATTR{idVendor}=="3297", GROUP="input"
  #   # Rule for the Moonlander
  #   SUBSYSTEM=="usb", ATTR{idVendor}=="3297", ATTR{idProduct}=="1969", GROUP="input"
  # '';

}
