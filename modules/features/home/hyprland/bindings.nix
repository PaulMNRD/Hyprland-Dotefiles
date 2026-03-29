{
  flake.homeModules.hyprlandBindings = {
    wayland.windowManager.hyprland.settings = {
      bind = [
        "SUPER, T, exec, kitty"
        "SUPER, Q, killactive"
        "SUPER, F, togglefloating"
      ];
    };
  };
}