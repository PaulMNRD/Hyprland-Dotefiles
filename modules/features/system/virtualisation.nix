{
  flake.nixosModules.virtualisation = { config, pkgs, ... }: {
    virtualisation.docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    
    users.groups.libvirtd.members = [ config.preferences.user.name ];
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = false;
      };
    };

    virtualisation.spiceUSBRedirection.enable = true;

    programs.virt-manager.enable = true;
    
    environment.systemPackages = with pkgs; [
      virt-manager
      spice-gtk
    ];
  };
}
