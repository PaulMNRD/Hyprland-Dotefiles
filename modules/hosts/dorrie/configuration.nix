{ self, ... }: {
  flake.nixosModules.dorrieConfiguration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      dorrieHardware

      options

      audio
      bluetooth
      boot
      hyprland
      keyboard
      localization
      logind
      networking
      nix
      steam
      user
      virtualisation
    ];

    preferences = {
      hostname = "paul-test-laptop";
      homeModules = with self.homeModules; [
        fish
        git
        helix
        home
        starship

        apps
      ];
    };

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

    environment.systemPackages = with pkgs; [
      helix
      git
    ];

    system.stateVersion = "26.05";
  };
}
