{
  description = "Atomic operating system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  }

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      
      panda = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/panda
        ];
      };

    };
  };
}
