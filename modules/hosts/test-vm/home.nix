{ self, ... }: {
  flake.homeModules.testVmHome = {
    home-manager.users.paul.imports = with self.homeModules; [
      home
    ];
  };
}