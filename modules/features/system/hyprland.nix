{
  flake.nixosModules.hyprland = {
    programs.hyprland.enable = true;
    programs.hyprland.xwayland.enable = true;
  };
}