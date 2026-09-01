{ self, ... }: {
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
      dunst
      hypridle
      hyprlock
      rofi
      screenshot
      wlogout
    ];

    services.polkit-gnome.enable = true;
    services.udiskie.enable = true;

    programs.btop.enable = true;
    catppuccin.btop.enable = true;
    catppuccin.btop.flavor = "mocha";
  };
}
