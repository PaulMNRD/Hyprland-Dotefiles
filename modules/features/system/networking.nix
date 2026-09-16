{
  flake.nixosModules.networking = { config, ... }: {
    networking.wireless.iwd = {
      enable = true;
      settings = {
        General.EnableNetworkConfiguration = true;
      };
    };
    networking.firewall.enable = true;
    networking.hostName = config.preferences.hostname;
  };
}
