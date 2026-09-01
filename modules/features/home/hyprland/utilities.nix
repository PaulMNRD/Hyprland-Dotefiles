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
    services.dunst.enable = true;
    catppuccin.dunst.enable = true;
    catppuccin.dunst.flavor = "mocha";

    programs.btop.enable = true;
    catppuccin.btop.enable = true;
    catppuccin.btop.flavor = "mocha";
  };
}
