{
  description = "Building personal machines.";

  inputs = {
    # NixOS official package source, here using the nixos-25.05 branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs :
  {
    # The host with the hostname `my-nixos` will use this configuration
    nixosConfigurations.hilbert = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hilbert.nix
      ];
    };

    nixosConfigurations.hausdorff = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hausdorff.nix
      ];
    };

    nixosConfigurations.runningman = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./runningman.nix
      ];
    };
  };
}
