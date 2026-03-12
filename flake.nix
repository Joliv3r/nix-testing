{
  description = "Building personal machines.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, ... }:
  {
    nixosConfigurations.hilbert = nixpkgs.lib.nixosSystem {
      modules = [
        ./hilbert.nix
      ];
    };

    nixosConfigurations.hausdorff = nixpkgs.lib.nixosSystem {
      modules = [
        ./hausdorff.nix
      ];
    };

    nixosConfigurations.runningman = nixpkgs.lib.nixosSystem {
      modules = [
        ./runningman.nix
      ];
    };
  };
}
