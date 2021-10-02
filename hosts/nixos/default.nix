{ self, lib, modulesPath, pkgs, suites, hardware, ... }:

{
  imports = lib.flatten suites.mobile ++
    [
      ./hardware.nix
    ];


  i18n.defaultLocale = "pl_PL.UTF-8";
  time.timeZone = "Europe/Warsaw";

  boot.supportedFilesystems = [ "btrfs" ];
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
  # services.udev.extraRules = ''
  #   SUBSYSTEM=="usb", ATTR{idVendor}=="3297", GROUP="input"
  #   # Rule for the Moonlander
  #   SUBSYSTEM=="usb", ATTR{idVendor}=="3297", ATTR{idProduct}=="1969", GROUP="input"
  # '';

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # For Redshift - not currently used
  # location = {
  #   latitude = 38.833881;
  #   longitude = -104.821365;
  # };

  # networking.useDHCP = false;

  nix.maxJobs = lib.mkDefault 16;

  services.xserver.videoDrivers = [ "amd" ];

  # services.fstrim.enable = true;

  services.picom = {
    backend = "glx";
    vSync = true;
  };

  security.mitigations.acceptRisk = true;

}
