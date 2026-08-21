{
  flake.nixosModules.gnome = { lib, pkgs, ... }: {
    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      gnome.core-apps.enable = false;
    };
    documentation.nixos.enable = false;
    
    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
    ];

    environment.systemPackages = with pkgs.gnomeExtensions; [
      blur-my-shell
      gsconnect
      user-themes
    ];
  };
}
