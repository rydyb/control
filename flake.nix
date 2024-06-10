{
  inputs = {
    artiq.url = "github:m-labs/artiq/release-8";
  };

  outputs = { self, artiq }:
    let
      pkgs = artiq.inputs.nixpkgs.x86_64-linux;
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = [
          (pkgs.python3.withPackages(ps: [
            artiq.packages.x86_64-linux.artiq
          ]))
        ];
      };
    };
}
