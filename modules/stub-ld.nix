{ pkgs, ... }:

{
  programs.nix-ld.enable = true;

  # For Celeste mods
  programs.nix-ld.libraries = with pkgs; [
    icu
  ];
}
