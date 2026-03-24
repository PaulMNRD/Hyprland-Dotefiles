{ self, ... }: {
  flake.nixosModules.testVmHardware = { config, lib, pkgs, modulesPath, ... }: {
    imports =
      [ (modulesPath + "/profiles/qemu-guest.nix")
    ];

    boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/f5c1afe9-b3ac-4623-a2a5-a49cef939773";
        fsType = "ext4";
      };

    swapDevices =
      [ { device = "/dev/disk/by-uuid/ae99969d-34fe-444b-8120-ee3fab60ca1f"; }
      ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}