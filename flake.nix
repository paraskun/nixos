{
  description = "Atomic operating system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    rftp = {
      url = "git+https://gitlab.eltex.loc/xpon/rftp?rev=5f643f569a533bbef98b3e1cae65a06861bd0dd2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-darwin, home-manager, nix-darwin, rftp }@inputs: {
    homeConfigurations = {
      container = home-manager.lib.homeManagerConfiguration {
        modules = [
          ./home/container
        ];
      };
    };

    nixosConfigurations = {
      panda = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;

          os = "nixos";
          hostName = "panda";
        };

        modules = [
          ./hosts/panda
          
          home-manager.nixosModules.home-manager
          { home-manager.extraSpecialArgs = specialArgs; }

          rftp.nixosModules.rftp
        ];
      };

      whale = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;

          os = "nixos";
          hostName = "whale";
        };

        modules = [
          ./hosts/whale

          home-manager.nixosModules.home-manager
          { home-manager.extraSpecialArgs = specialArgs; }
        ];
      };
    };

    darwinConfigurations = {
      beaver = nix-darwin.lib.darwinSystem rec {
        system = "aarch64-darwin";

        specialArgs = {
          inherit inputs;

          nixpkgs = nixpkgs-darwin;
          os = "macos";
          hostName = "beaver";
        };

        modules = [
          ./hosts/beaver

          home-manager.darwinModules.home-manager
          { home-manager.extraSpecialArgs = specialArgs; }
        ];
      };
    };
  };
}
