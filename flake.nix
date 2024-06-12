{
  inputs = {
    nixpkgs.follows = "artiq/nixpkgs";

    artiq.url = "github:m-labs/artiq/release-8";
    devenv.url = "github:cachix/devenv";
  };

  outputs = { self, nixpkgs, artiq, devenv, ... } @ inputs:
    let
      system = "x86_64-linux";

      pkgs = nixpkgs.legacyPackages.${system};

      control = pkgs.python3Packages.buildPythonPackage {
        pname = "rydyb-control";
        version = "0.0.0";
        src = self;
        nativeBuildInputs = [ pkgs.qt5.wrapQtAppsHook ];
        propagatedBuildInputs = [
          artiq.packages.${system}.artiq
        ];
      };
    in rec {
      packages.${system}.default = control;

      devShells.${system}.default = devenv.lib.mkShell {
        inherit inputs pkgs;
        modules = [
          ({ pkgs, config, ... }: {
            packages = [
              artiq.packages.${system}.artiq
              control
            ];
          })
        ];
      };
    };
}
