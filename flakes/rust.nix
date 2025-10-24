{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    naersk.url = "github:nix-community/naersk";

    nixpkgs-mozilla = {
      url = "github:mozilla/nixpkgs-mozilla";
      flake = false;
    };
  };

  outputs = { self, flake-utils, naersk, nixpkgs, nixpkgs-mozilla }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import nixpkgs) {
          inherit system;

          overlays = [
            (import nixpkgs-mozilla)
          ];
        };

        channel = (pkgs.rustChannelOf {
          rustToolchain = ./rust-toolchain.toml;
          sha256 = "";
          #        ^ After you run `nix build`, replace this with the actual
          #          hash from the error message
        });

        toolchain = channel.rust;

        # rust-src needed for nvim to use rust-analyzer properly.
        rust-src = channel.rust-src;

        naersk' = pkgs.callPackage naersk {
          cargo = toolchain;
          rustc = toolchain;
        };

      in {
        # For `nix build` & `nix run`:
        defaultPackage = naersk'.buildPackage {
          src = ./.;  # Change src if flakes is not in root of rust project.
        };

        # For `nix develop` (optional, can be skipped):
        devShell = pkgs.mkShell {
          nativeBuildInputs = [ 
            toolchain
            rust-src
          ];

          # buildInputs = with pkgs; [
          #   pkg-config
          # ];

          # Uncomment if using other libraries and add rec to mkShell
          # LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;

          # Path to rust-src for nvim to use rust-analyzer properly
          RUST_SRC_PATH = "${rust-src}/lib/rustlib/src/rust/library";
        };
      }
    );
}
