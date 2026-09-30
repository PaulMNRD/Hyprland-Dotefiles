{ self, inputs, ... }: {
  flake.nixosModules.soarrieConfiguration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      soarrieHardware

      options

      audio
      android-dev
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
      enable32Bit = true;
    };

    environment.systemPackages = (with pkgs; [
      devenv
      lunar-client
      git
    ]) ++ [
      (inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
        enableYaziIntegration = true;
      })
    ];

    system.stateVersion = "26.05";
  };
}
