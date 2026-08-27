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
      hypridle
      hyprlock
      wleave
    ];
    
    programs.btop.enable = true;
    catppuccin.btop.enable = true;
    catppuccin.btop.flavor = "mocha";
  };
}
