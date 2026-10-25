{ self, ... }: {
  flake.nixosModules.soarrieConfiguration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      soarrieHardware
      common
    ];

    preferences.hostname = "paul-desktop";

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
