{
  flake.homeModules.waybar = {
    programs.waybar = {
      enable = true;
      systemd = {
        enable = true;
      };
    };
  };
}
