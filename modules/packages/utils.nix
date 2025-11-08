{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
    git
    stow
    coreutils
    bash
    gnumake
    gnused
    gnutar
    unzip
    zip
    killall
    fd
    ripgrep
    fzf
    file
    python314
  ];
}
