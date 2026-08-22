{ self, ... }: {
  flake.nixosModules.florrieConfiguration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      florrieHardware

      options

      bluetooth
      hyprland
      keyboard
      localization
      networking
      nix
      pipewire
      boot
      sddm
      user
    ];

    preferences = {
      hostname = "paul-test-vm";
      homeModules = with self.homeModules; [
        fish
        git
        helix
        home
        hyprland
        starship
        vscodium
        zen-browser
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
