{ self, ... }: {
  flake.nixosModules.florrieConfiguration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      florrieHardware

      options

      bluetooth
      hyprland
      keyboard
      localization
      logind
      networking
      nix
      pipewire
      boot
      user
    ];

    preferences = {
      hostname = "paul-test-laptop";
      homeModules = with self.homeModules; [
        fish
        git
        helix
        home
        starship
      ];
    };

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
    };

    environment.systemPackages = with pkgs; [
      helix
      git
    ];

    system.stateVersion = "26.05";
  };
}
