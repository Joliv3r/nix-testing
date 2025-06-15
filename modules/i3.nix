{ pkgs, ... }:

{
  environment.pathsToLink = [ "/libexec" ];  # links /libexec from derivations to /run/current-system/sw

  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
  ];
  
  services.displayManager.defaultSession = "none+i3";
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        jq
        dmenu
        polybar
        alacritty
        neofetch
      ];
    };
  }; 
  programs.i3lock.enable = true;
}
