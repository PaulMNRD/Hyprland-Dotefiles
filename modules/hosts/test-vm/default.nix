{ self, inputs, ... }: {
  flake.nixosConfigurations.testVm = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.testVmConfiguration
      inputs.home-manager.nixosModules.home-manager
    ];
  };
}