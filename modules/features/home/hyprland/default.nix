{ self, inputs, ... }: {
  flake.homeModules.hyprland = { pkgs, ... }: {
    imports = with self.homeModules; [ 
      awww
      cursor
      #hyprpaper
      kitty
      # quickshell
    ];

     wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
    };

    xdg.configFile."hypr" = {
      source = "${inputs.self}/assets/hyprland";
      recursive = true;
    };
  };
}
