{
  description = "The flake to rule my world";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable"; 
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };  

    plugin-onedark.url = "github:navarasu/onedark.nvim";
    plugin-onedark.flake = false;

  };

  outputs = {self, nixpkgs, home-manager, ...}@inputs:
    let 
      lib = nixpkgs.lib;
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
        extraSpecialArgs = {inherit inputs;};
      };
    };
  };

}
