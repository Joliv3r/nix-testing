{ pkgs, config, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.scrambler = {
    isNormalUser = true;
    extraGroups = []
      ++ ( if ( config.networking.networkmanager.enable ) then [ "networkmanager" ] else [ ] );
    hashedPassword = "$y$j9T$iwldPc3KAcAbDIGUYY1Pw0$DaR2PqvqFoM1JIu5SB1Ghu.iKJe1DZTN7fssQS6KVBB";
    packages = with pkgs; [
      zathura
      ffmpeg
    ];
  };
}
