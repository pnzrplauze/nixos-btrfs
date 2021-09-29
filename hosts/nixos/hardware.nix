# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.rtw89 ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/2f281ab2-85c7-4dd1-af7d-0b38962e29ef";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" "noatime" ];
    };

  boot.initrd.luks.devices."enc".device = "/dev/disk/by-uuid/80d32392-f4cf-4967-b1ff-b2af40113071";

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/2f281ab2-85c7-4dd1-af7d-0b38962e29ef";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" "noatime" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/B8FC-0203";
      fsType = "vfat";
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/a3b4a015-dec7-424e-a3fa-263000a75845"; }];

  hardware.cpu.amd.updateMicrocode = true;

}
