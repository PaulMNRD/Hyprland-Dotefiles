{ self, inputs, ... }: {
  flake.nixosModules.florrieConfiguration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      florrieHardware

      options

      audio
      bluetooth
      hyprland
      keyboard
      localization
      logind
      networking
      nix
      boot
      user
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

    environment.systemPackages = (with pkgs; [
      devenv
      git
    ]) ++ [
      (inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
        enableYaziIntegration = true;
      })
    ];

    system.stateVersion = "26.05";
  };
}
