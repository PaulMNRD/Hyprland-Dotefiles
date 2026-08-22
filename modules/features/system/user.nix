{ self, inputs, ... }: {
  flake.nixosModules.user = { config, pkgs, ... }: 
  let username = config.preferences.user.name;
  in {
    programs.fish.enable = true;
    users.users.${username} = {
      isNormalUser = true;
      description = config.preferences.user.fullName;
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.fish;
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      extraSpecialArgs = { inherit (config) preferences; };
      users.${username}.imports = config.preferences.homeModules
        ++ [ inputs.catppuccin.homeModules.catppuccin ];
    };

    system.activationScripts.userIcon = {
      text = ''
        install -Dm644 ${inputs.self}/assets/avatar.png /var/lib/AccountsService/icons/${username}
      '';
    };
  };
}
