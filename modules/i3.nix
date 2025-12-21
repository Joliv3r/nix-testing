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
        fastfetch
        brightnessctl
        scrot
        i3-swallow
      ];
    };
  }; 
  programs.i3lock.enable = true;

  # Make sure polybar has pulse support
  nixpkgs.config.packageOverrides = pkgs: {
    polybar = pkgs.polybar.override {
      pulseSupport = true;
    };
  };
}
