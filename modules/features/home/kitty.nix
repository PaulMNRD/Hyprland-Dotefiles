{
  flake.homeModules.kitty = { pkgs, ... }: {
    programs.kitty = {
      enable = true;
      package = pkgs.kitty;
      settings = {
        confirm_os_window_close = 0;
        enable_audio_bell = false;
        font_size = 14;
        background_opacity = 0.8;
        background_blur = 0;
      };
      themeFile = "Catppuccin-Frappe";
    };
  };
}