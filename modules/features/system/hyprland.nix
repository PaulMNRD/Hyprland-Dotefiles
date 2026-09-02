{ self, ... }: {
  flake.nixosModules.hyprland = { pkgs, ... }: {
    preferences.homeModules = [ self.homeModules.hyprland ];
    
    imports = with self.nixosModules; [
      sddm  
    ];

    environment.systemPackages = with pkgs; [
      qt5.qtwayland
      qt6.qtwayland
    ];

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true; 
    };

    security.pam.services.hyprlock = {};
    services.gnome.gnome-keyring.enable = true;
    services.udisks2.enable = true;
    
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-termfilechooser
      ];
      config.hyprland = {
        default = [ "hyprland" "gtk" ];
        "org.freedesktop.portal.FileChooser" = [ "termfilechooser" ];
      };
    };
  };
}
