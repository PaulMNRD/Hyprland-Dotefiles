{ self, ... }: {
  flake.homeModules.gnome = { pkgs, ... }: {
    imports = with self.homeModules; [
      terminal
    ];

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
    };
  };
}