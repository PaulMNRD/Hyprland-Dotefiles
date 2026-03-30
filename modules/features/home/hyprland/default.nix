{ self, ... }: {
  flake.homeModules.hyprland = { pkgs, ... }: {
    imports = with self.homeModules; [ 
      hyprlandAnimations
      hyprlandBindings
      hyprlandDecoration
      hyprlandGeneral
      hyprpaper
      quickshell
    ];

     wayland.windowManager.hyprland = {
      enable = true;
      package = pkgs.hyprland;

      settings = {
        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };

        monitor = ", preferred, auto, 1";
      };
    };
  };
}