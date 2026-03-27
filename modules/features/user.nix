{ self, ... }: {
  flake.nixosModules.user = { pkgs, ... }: {
    programs.fish.enable = true;
    users.users.paul = {
      isNormalUser = true;
      description = "Paul";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.fish;
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.paul = self.homeModules.home;
    };
  };
}
