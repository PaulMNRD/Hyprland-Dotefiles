{ self, ... }: {
  flake.nixosModules.testVmConfiguration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      testVmHardware

      options

      bluetooth
      #gnome
      hyprland
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
        fish
        git
        #gnome
        helix
        home
        hyprland
        starship
        vscodium
      ];
    };

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      consoleLogLevel = 0;
      initrd.verbose = false;
      loader.timeout = 0;
      loader.grub = {
        enable = true;
        device = "/dev/vda";
        # useOSProber = true;
        timeoutStyle = "hidden";
      };

      kernelParams = [
        "quiet"
        "splash"
        "loglevel=3"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
      ];

      plymouth = {
        enable = true;
        theme = "breeze";
      };
    };

    environment.systemPackages = with pkgs; [
      helix
      git
    ];

    system.stateVersion = "26.05";
  };
}
