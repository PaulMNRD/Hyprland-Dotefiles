{
  flake.nixosModules.networking = { pkgs, config, ... }: {
    environment.systemPackages = with pkgs; [
      proton-vpn-cli
    ];

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
