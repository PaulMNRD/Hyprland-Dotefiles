{
  flake.homeModules.hyprlandGeneral = {
    wayland.windowManager.hyprland.settings = {
      general = {
        gaps_in = 10;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "0xFFCA9EE6 0xFFF4B8E4";
        "col.inactive_border" = "0x00ffffff";
      };
    };
  };
}