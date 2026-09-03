{ inputs, ... }: {
  flake.homeModules.rofi = { pkgs, ... }: {
    programs.rofi = {
      enable = true;
      font = "JetBrainsMono Nerd Font 12";
      package = pkgs.rofi;
      modes = [
        "drun"
        {
          name = "wallpaper";
          path = "${inputs.self}/assets/rofi/scripts/wallpaper.sh";
        }
      ];
      
      extraConfig = {
        display-drun = "⌘";
        display-wallpaper = "⬖";
        display-window = "❐";
        drun-display-format = "{name}";
        window-format = "{w}{t}";
        show-icons = true;
        icon-theme = "Fluent-purple-dark";
        drun-match-fields = "name,generic,categories,keywords";
      };

      theme = "${inputs.self}/assets/rofi/theme.rasi";
    };
  };
}
