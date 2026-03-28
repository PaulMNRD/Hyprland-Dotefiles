{
  flake.homeModules.kitty = { pkgs, ... }: {
    programs.kitty = {
      enable = true;
      package = pkgs.kitty;
      settings = {
        confirm_os_window_close = 0;
        enable_audio_bell = false;
        font_size = 8;
      };
      themeFile = "Catppuccin-Frappe";
    };
  };
}