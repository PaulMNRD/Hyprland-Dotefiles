{
  description = "Flake configuration with home-manager";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix/release-25.11";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    catppuccin,
    ...
   }: {
    nixosConfigurations.paul-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        catppuccin.nixosModules.catppuccin
        home-manager.nixosModules.home-manager
        {
          home-manager.users.paul = import ./home.nix;
        }
      ];
    };
  };
}
