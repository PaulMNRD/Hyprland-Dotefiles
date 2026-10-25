{ self, ... }: {
  flake.nixosModules.dorrieConfiguration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      dorrieHardware
      common
    ];

    preferences.hostname = "paul-laptop";

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };

    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
        intel-compute-runtime
      ];
    };

    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
    };
  };
}
