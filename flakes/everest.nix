{
  description = "Flake for installing Everest";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { system = system; };
    olympus-path = "/home/joliver/celeste/linux.main/olympus";
  in 
  {
    packages.x86_64-linux.olympus = pkgs.writeShellScriptBin "run-olympus" "${olympus-path}";

    devShells.${system}.default = pkgs.mkShell rec {
      nativeBuildInputs = with pkgs; [
        everest-mons
      ];
      buildInputs = with pkgs; [
        stdenv.cc.cc.lib
        icu
        openssl
      ];

      NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
    };
  };
}
