{ self, ... }: {
  flake.nixosModules.testVmConfiguration = { pkgs, ... }: {
    imports = with self.nixosModules; [
      testVmHardware

      bluetooth
      keyboard
      localization
      networking
      nix
      pipewire
      #sddm
      user
    ];

    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/vda";
    boot.loader.grub.useOSProber = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "paul-laptop";
    zramSwap.enable = true;

    environment.systemPackages = with pkgs; [
      helix
      git
    ];

    system.stateVersion = "25.11";
  };
}