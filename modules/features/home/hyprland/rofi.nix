{ inputs, ... }: {
  flake.homeModules.rofi = { pkgs, config, ... }: {
    programs.rofi = {
      enable = true;
      font = "JetBrainsMono Nerd Font 12";
      package = pkgs.rofi;
      modes = [
        "drun"
        {
          name = "system";
          path = "${inputs.self}/assets/rofi/scripts/system.sh";
        }
        {
          name = "wallpaper";
          path = "${inputs.self}/assets/rofi/scripts/wallpaper.sh";
        }
        "window"
      ];
      
      extraConfig = {
        display-drun = "⌘";
        display-system = "⚙";
        display-wallpaper = "⬖";
        display-window = "❐";
        drun-display-format = "{name}";
        window-format = "{w}{t}";
        show-icons = true;
        icon-theme = "Fluent-purple-dark";
      };

      theme = "${inputs.self}/assets/rofi/theme.rasi";
    };
  };
}
