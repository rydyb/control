{
  inputs = {
    nixpkgs.follows = "artiq/nixpkgs";

    artiq.url = "github:m-labs/artiq/release-8";
  };

  outputs = { self, nixpkgs, artiq }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      control = pkgs.python3Packages.buildPythonPackage {
        pname = "rydyb-control";
        version = "0.0.0";
        src = self;
        nativeBuildInputs = [ pkgs.qt5.wrapQtAppsHook ];
        propagatedBuildInputs = [
          artiq.packages.x86_64-linux.artiq
        ];
      };
    in rec {
      packages.x86_64-linux = {
        inherit control;
      };

      packages.x86_64-linux.default = pkgs.python3.withPackages(ps: [
        packages.x86_64-linux.control
      ]);
    };
}
