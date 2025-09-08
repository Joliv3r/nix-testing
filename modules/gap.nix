{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gap-full
  ];
}
