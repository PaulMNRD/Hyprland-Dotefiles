{ self, inputs, ... }: {
  flake.nixosConfigurations.florrie = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.florrieConfiguration
      inputs.home-manager.nixosModules.home-manager
      inputs.catppuccin.nixosModules.catppuccin
    ];
  };
}
