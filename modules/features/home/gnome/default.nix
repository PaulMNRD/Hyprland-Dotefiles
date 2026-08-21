{ self, inputs,  ... }: {
  flake.homeModules.gnome = { ... }: {
    imports = with self.homeModules; [
      terminal
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
        folder-children = [ "SystemApps" ];
      };
      "org/gnome/desktop/app-folders/folders/SystemApps" = {
        name = "System Apps";
        apps = [
          "org.gnome.baobab.desktop"
          "org.gnome.DiskUtility.desktop"
          "org.gnome.SystemMonitor.desktop"
        ];
      };
      "org/gnome/shell" = {
        enabled-extensions = [
          "blur-my-shell@aunetx"
          "gsconnect@andyholmes.github.io"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
