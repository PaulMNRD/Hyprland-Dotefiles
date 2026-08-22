{ self, inputs,  ... }: {
  flake.homeModules.gnome = { pkgs, ... }: {
    home.packages = with pkgs; [
      gnome-tweaks
      nautilus
    ];
    
    imports = with self.homeModules; [
      cursor
      terminal
      gtkTheme
    ];

    home.file = {
      "Pictures/Wallpapers" = {
        source = "${inputs.self}/assets/wallpapers";
        recursive = true;
      };
    };

    dconf.enable = true;
    dconf.settings = {
      "org/gnome/desktop/app-folders" = {
        folder-children = [ "SystemApps" "Utilities" ];
      };
      "org/gnome/desktop/app-folders/folders/SystemApps" = {
        name = "System";
        apps = [
          "org.gnome.baobab.desktop"
          "org.gnome.DiskUtility.desktop"
          "net.nokyan.Resources.desktop"
        ];
      };
      "org/gnome/desktop/app-folders/folders/Utilities" = {
        name = "Utilities";
        apps = [
          "org.gnome.Papers.desktop"
          "org.gnome.Loupe.desktop"
        ];
      };
      "org/gnome/shell" = {
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "org.gnome.Ptyxis.desktop"
        ];
        
        enabled-extensions = [
          "AlphabeticalAppGrid@stuarthayhurst"
          "appindicator@rgcjonas.gmail.com"
          "blur-my-shell@aunetx"
          "dash-to-dock@micxgx.gmail.com"
          "gsconnect@andyholmes.github.io"
          "hide-cursor@elcste.com"
          "hidetopbar@mathieu.bidon.ca"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
        ];
      };
      "org/gnome/shell/extensions/hidetopbar" = {
        enable-active-window = false;
      };
      "org/gnome/shell/extensions/dash-to-dock" = {
        show-trash = false;
      };
      "org/gnome/shell/extensions/hide-cursor-elcste-com" = {
        timeout = 1;
      };
      "org/gnome/shell/extensions/alphabetical-app-grid" = {
        folder-order-position = "end";
      };
    };
  };
}
