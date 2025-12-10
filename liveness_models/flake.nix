{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils}:
    flake-utils.lib.eachDefaultSystem ( system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config = { allowUnfree = true; };
        };
        pythonPackages = pkgs.python3Packages;
      in {
        devShell = pkgs.mkShell {
          packages = with pkgs;[
            gcc
            bison
            cmake
            flex
            gmp
            bash
            
            pythonPackages.python

            pythonPackages.venvShellHook

            pythonPackages.numpy
            pythonPackages.requests
          ];

            venvDir = "./.venv";
            # Run this command, only after creating the virtual environment
            postVenvCreation = ''
                unset SOURCE_DATE_EPOCH
                pip install -r requirements.txt
            '';
        };
      }
    );
}
