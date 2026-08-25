{ self, ... }: {
  flake.nixosModules.gnome = { lib, pkgs, ... }: {
    preferences.homeModules = [ self.homeModules.gnome ];

    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      gnome.core-apps.enable = false;
    };
    documentation.nixos.enable = false;
    
    environment.gnome.excludePackages = [ pkgs.gnome-tour ];

    environment.systemPackages = with pkgs; [
      baobab
      gnome-disk-utility
      resources
      papers
      loupe
      gnomeExtensions.alphabetical-app-grid
      gnomeExtensions.appindicator
      gnomeExtensions.blur-my-shell
      gnomeExtensions.dash-to-dock
      gnomeExtensions.gsconnect
      gnomeExtensions.hide-cursor
      gnomeExtensions.hide-top-bar
      gnomeExtensions.user-themes
    ];
  };
}
