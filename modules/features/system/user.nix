{ self, ... }: {
  flake.nixosModules.user = { config, pkgs, ... }: 
  let username = config.preferences.user.name;
  in {
    programs.fish.enable = true;
    users.users.${username} = {
      isNormalUser = true;
      description = "${username}'s account";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.fish;
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      extraSpecialArgs = { inherit (config) preferences; };
      users.${username}.imports = config.preferences.homeModules;
    };
  };
}
