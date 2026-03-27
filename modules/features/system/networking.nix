{
  flake.nixosModules.networking = { config, ... }: {
    networking.networkmanager.enable = true;
    networking.firewall.enable = true;
    networking.hostName = config.preferences.hostname;
  };
}