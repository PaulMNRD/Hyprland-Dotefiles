{ self, ... }: {
  flake.nixosModules.testVmConfiguration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      testVmHardware

      options

      bluetooth
      gnome
      #hyprland
      keyboard
      localization
      networking
      nix
      pipewire
      sddm
      user
    ];

    preferences = {
      hostname = "paul-test-vm";
      homeModules = with self.homeModules; [
        git
        gnome
        helix
        home
        #hyprland
        kitty
      ];
    };

    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/vda";
    boot.loader.grub.useOSProber = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;

    environment.systemPackages = with pkgs; [
      helix
      git
    ];

    system.stateVersion = "25.11";
  };
}
