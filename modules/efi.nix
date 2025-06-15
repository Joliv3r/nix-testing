{ ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Limit the maximum amount of latest generation entries in the boot menu.
  boot.loader.systemd-boot.configurationLimit = 100;

  # Why is this not on by default?
  boot.tmp.cleanOnBoot = true;
}

