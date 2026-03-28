{
  flake.homeModules.hyprland = { pkgs, ... }: {
     wayland.windowManager.hyprland = {
      enable = true;
      package = pkgs.hyprland;

      settings = {
        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };

        bind = [
          "SUPER, T, exec, kitty"
        ];
      };
    };
  };
}