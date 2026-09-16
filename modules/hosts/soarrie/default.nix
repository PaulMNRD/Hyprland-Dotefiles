{ self, inputs, ... }: {
  flake.nixosConfigurations.soarrie = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.soarrieConfiguration
      inputs.home-manager.nixosModules.home-manager
      inputs.catppuccin.nixosModules.catppuccin
    ];
  };
}
