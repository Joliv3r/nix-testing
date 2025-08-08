{ lib, ... }:

{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # Enforce sshd service to not be enabled
  systemd.services.sshd.wantedBy = lib.mkForce [ ];
}

