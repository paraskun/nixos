{
  description = "Rapid FTP server";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system}.rftp = pkgs.callPackage ./nix/package.nix {};
      packages.${system}.default = self.packages.${system}.rftp;
      
      nixosModules.rftp = ./nix/module.nix;
      nixosModules.default = self.nixosModules.rftp;
    };
}
