{ self, ... }: {
  flake.nixosModules.testVmConfiguration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      testVmHardware

      options

      bluetooth
      gnome
      # hyprland
      keyboard
      localization
      networking
      nix
      pipewire
      boot
      # sddm
      user
    ];

    preferences = {
      hostname = "paul-test-vm";
      homeModules = with self.homeModules; [
        fish
        git
        gnome
        helix
        home
        # hyprland
        # java
        starship
        vscodium
        zen-browser
      ];
    };

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      loader.grub = {
        enable = true;
        device = "/dev/vda";
        timeoutStyle = "hidden";
      };
    };

    environment.systemPackages = with pkgs; [
      helix
      git
    ];

    system.stateVersion = "26.05";
  };
}
