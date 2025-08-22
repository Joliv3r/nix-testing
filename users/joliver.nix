{ pkgs, config, ... }:

{
  programs.zsh.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.joliver = {
    isNormalUser = true;
    extraGroups = [ "wheel" ] # Enable ‘sudo’ for the user.
      ++ ( if ( config.networking.networkmanager.enable ) then [ "networkmanager" ] else [ ] );

    shell = pkgs.zsh;
    packages = with pkgs; [
      zoxide
      qutebrowser
      pass
      signal-desktop
      tmux
      zathura
      tldr
      brave
    ];
  };

  programs.firefox.enable = true;
  programs.direnv.enable = true;
}
