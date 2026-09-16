{ self, inputs, ... }: {
  flake.nixosConfigurations.dorrie= inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.dorrieConfiguration
      inputs.home-manager.nixosModules.home-manager
      inputs.catppuccin.nixosModules.catppuccin
    ];
  };
}
