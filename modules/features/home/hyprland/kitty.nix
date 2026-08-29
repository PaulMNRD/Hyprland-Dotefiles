{
  flake.homeModules.kitty = { pkgs, ... }: {
    programs.kitty = {
      enable = true;

      font = {
        name = "JetBrainsMono Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      settings = {
        allow_remote_control = "yes";
        confirm_os_window_close = 0;
        enable_audio_bell = false;
        font_size = 14;
        background_opacity = 0.8;
      };

      themeFile = "Catppuccin-Mocha";

      keybindings = {
        "ctrl+shift+x" = "launch --type=tab --cwd=current --tab-title=Editor hx .";
        "ctrl+shift+g" = "launch --type=tab --cwd=current --tab-title=Git gitui";
        "ctrl+shift+e" = "launch --type=tab --cwd=current --tab-title=Explorer yazi";
        "alt+1" = "goto_tab 1";
        "alt+2" = "goto_tab 2";
        "alt+3" = "goto_tab 3";
        "alt+4" = "goto_tab 4";
        "alt+5" = "goto_tab 5";
        "alt+6" = "goto_tab 6";
        "alt+7" = "goto_tab 7";
        "alt+8" = "goto_tab 8";
        "alt+9" = "goto_tab 9";
      };
    };
  };
}
