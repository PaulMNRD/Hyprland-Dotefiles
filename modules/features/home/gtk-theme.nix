{ inputs, ... }: {
  flake.homeModules.gtk-theme = { pkgs, ... }: {
    gtk = {
      enable = true;
      theme = {
        name = "Catppuccin-Dark";
        package = pkgs.runCommand "catppuccin-gtk-dark" {} ''
          mkdir -p $out/share/themes
          cp -r ${inputs.self}/assets/gtk/Catppuccin-Dark $out/share/themes/
        '';
      };
      iconTheme = {
        name = "Fluent-purple-dark";
        package = pkgs.fluent-icon-theme.override {
          colorVariants = [ "purple" ];
        };
      };
    };

    home.file.".config/gtk-4.0/gtk.css".source =
      "${inputs.self}/assets/gtk/Catppuccin-Dark/gtk-4.0/gtk.css";
    home.file.".config/gtk-4.0/gtk-dark.css".source =
      "${inputs.self}/assets/gtk/Catppuccin-Dark/gtk-4.0/gtk-dark.css";
    home.file.".config/gtk-4.0/assets" = {
      source = "${inputs.self}/assets/gtk/Catppuccin-Dark/gtk-4.0/assets";
      recursive = true;
    };

    dconf.enable = true;
    dconf.settings = {
      "org/gnome/desktop/wm/preferences" = {
        button-layout = ":minimize,maximize,close";
      };
      "org/gnome/desktop/interface" = {
        gtk-theme = "Catppuccin-Dark";
        icon-theme = "Fluent-purple-dark";
        color-scheme = "prefer-dark";
        accent-color = "purple";
      };
    };
  };
}
