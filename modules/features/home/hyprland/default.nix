{ self, inputs, ... }: {
  flake.homeModules.hyprland = { pkgs, ... }: {
    imports = with self.homeModules; [ 
      hyprpaper
      kitty
      quickshell
    ];

     wayland.windowManager.hyprland = {
      enable = true;
      package = pkgs.hyprland;
    };

    xdg.configFile."hypr" = {
      source = "${inputs.self}/assets/hyprland";
      recursive = true;
    };
  };
}
