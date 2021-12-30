{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: {
      packages.crc-reveng = nixpkgs.legacyPackages.${system}.callPackage ./crc-reveng.nix {};
      apps.crc-reveng = {
        type = "app";
        program = "${self.packages.${system}.crc-reveng}/bin/crc-reveng";
      };
      defaultPackage = self.packages.${system}.crc-reveng;
      defaultApp = self.apps.${system}.crc-reveng;
    });
}
