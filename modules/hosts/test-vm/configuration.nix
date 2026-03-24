{ self, ... }: {
  flake.nixosModules.testVmConfiguration = { pkgs, ... }: {
    imports = [
      self.nixosModules.testVmHardware

      self.nixosModules.keyboard
      self.nixosModules.nix
      self.nixosModules.localization
    ];

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