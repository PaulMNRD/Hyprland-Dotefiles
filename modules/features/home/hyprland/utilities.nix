{ inputs, self, ... }: {
  flake.homeModules.hypr-utilities = { pkgs, ... }: {
    home.packages = with pkgs; [
      bluetui
      brightnessctl
      hyprpicker
      impala
      wl-clipboard
    ];

    imports = with self.homeModules; [
      battery
      hypridle
      hyprlock
      rofi
      wlogout
    ];

    services.polkit-gnome.enable = true;
    services.dunst = {
      enable = true;
      settings = {
        global = {
          width = 350;
          height = 150;
          offset = "10x10";
          origin = "top-right";
          gap_size = 5;
          font = "JetBrainsMono Nerd Font 12";
          line_height = 4;
          corner_radius = 12;
          frame_width = 2;
          frame_color = "#313244";
          word_wrap = true;
          ignore_newline = false;
          stack_duplicates = true;
          hide_duplicate_count = false;
          icon_position = "left";
          min_icon_size = "48";
          max_icon_size = "64";
          icon_theme = "Fluent-purple-dark";
          browser = "xdg-open";
          always_run_script = true;
          follow = "mouse";
        };

        urgency_low = {
          background = "#11111be6";
          foreground = "#cdd6f4";
          frame_color = "#313244";
          tiemout = 4;
        };
        urgency_normal = {
          background = "#11111be6";
          foreground = "#cdd6f4";
          frame_color = "#cba6f7";
          timeout = 4;
        };
        urgency_critical = {
          background = "#11111be6";
          foreground = "#cdd6f4";
          frame_color = "#f38ba8";
          timeout = 0;
        };
      };
    };

    programs.btop.enable = true;
    catppuccin.btop.enable = true;
    catppuccin.btop.flavor = "mocha";
  };
}
