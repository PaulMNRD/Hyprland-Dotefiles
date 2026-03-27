{ self, ... }: {
  flake.nixosModules.testVmConfiguration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      testVmHardware

      options

      bluetooth
      keyboard
      localization
      networking
      nix
      pipewire
      #sddm
      user
    ];

    preferences = {
      hostname = "paul-test-vm";
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