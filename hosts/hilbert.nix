{ ... }:

{
  networking.hostName = "hilbert"; # Define your hostname.
  boot.blacklistedKernelModules = [ "elan_i2c" ];
}
