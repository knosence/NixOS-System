{
  description = "The flake to rule my world";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccinifier.url = "github:lighttigerXIV/catppuccinifier";
    catppuccinifier.inputs.nixpkgs.follows = "nixpkgs";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
    let
      inherit (nixpkgs) lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [ ./Profiles/Knosence/configuration.nix ];
        };
      };

      homeConfigurations = {
        knosence = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./Profiles/Knosence/home.nix ];
          extraSpecialArgs = { inherit inputs; };
        };
      };

    };

}
