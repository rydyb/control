{
  inputs.extrapkg.url = "git+https://git.m-labs.hk/M-Labs/artiq-extrapkg.git";
  outputs = { self, extrapkg }:
    let
      pkgs = extrapkg.pkgs;
      artiq = extrapkg.packages.x86_64-linux;
    in {
      packages.x86_64-linux.default = pkgs.buildEnv {
        name = "artiq-env";
        paths = [
          (pkgs.python3.withPackages(ps: [
            artiq.artiq
            artiq.flake8-artiq
          ]))
          pkgs.vscodium
        ];
      };
    };
  nixConfig = {  # work around https://github.com/NixOS/nix/issues/6771
    extra-trusted-public-keys = "nixbld.m-labs.hk-1:5aSRVA5b320xbNvu30tqxVPXpld73bhtOeH6uAjRyHc=";
    extra-substituters = "https://nixbld.m-labs.hk";
  };
}