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
          brightness = 0.3;
          vibrancy = 0.3;
          vibrancy_darkness = 0.0;
        };

        input-field = [{
          size = "250, 40";
          outline_thickness = 2;
          dots_size = 0.20;
          dots_spacing = 0.20;
          outer_color = "rgb(cba6f7) rgb(f5c2e7) 45deg"; 
          inner_color = "rgba(30, 30, 46, 0.0)";
          font_color = "rgb(cdd6f4)";
          font_family = "JetBrainsMono Nerd Font";
          fade_on_empty = true;
          placeholder_text = "Input Password...";
          hide_input = false;
          check_color = "rgb(a6e3a1) rgb(94e2d5) 45deg";
          check_text = "...";
          fail_color = "rgb(f38ba8) rgb(fab387) 45deg";
          fail_text = "Authentication Failed";
        }];
      };
    };
  };
}
