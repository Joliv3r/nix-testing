{ ... }:
{
  virtualisation.docker.enable = true;
  users.users.joliver.extraGroups = [ "docker" ];
}
