{ self, ... }: {
  flake.nixosModules.testVmConfiguration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      testVmHardware

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
      user
      virtualisation
    ];

    preferences = {
      hostname = "paul-test-vm";
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
