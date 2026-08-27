{ inputs, ... }: {
  flake.homeModules.hyprlock = {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          hide_cursor = true;
        };

        background = {
          path = "screenshot";
          blur_size = 6;
          blur_passes = 2;
          noise = 0;
          contrast = 1.1;
          brightness = 0.9;
          vibrancy = 0.3;
          vibrancy_darkness = 0.0;
        };

        input-field = [{
          size = "250, 50";
          outline_thickness = 2;
          dots_size = 0.20;
          dots_spacing = 0.15;
          outer_color = "rgb(cba6f7)"; 
          inner_color = "rgba(30, 30, 46, 0.9)";
          font_color = "rgb(cdd6f4)";
          font_family = "JetBrainsMono Nerd Font";
          fade_on_empty = true;
          placeholder_text = "";
          hide_input = false;
          check_color = "a6e3a1";
          fail_color = "f38ba8";
          capslock_color = "rbg(fab387)";
        }];
      };
    };
  };
}
