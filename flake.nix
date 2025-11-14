{
  description = "Building personal machines.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
