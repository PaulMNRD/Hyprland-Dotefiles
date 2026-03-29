{
  flake.homeModules.hyprlandGeneral = {
    wayland.windowManager.hyprland.settings = {
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 3;
        "col.active_border" = "0xFFCA9EE6 0xFFF4B8E4";
        "col.inactive_border" = "0x00ffffff";
      };
    };
  };
}