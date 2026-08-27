{ inputs, self, ... }: {
  flake.homeModules.hypr-utilities = { pkgs, ... }: {
    home.packages = with pkgs; [
      bluetui
      hyprpicker
      impala
      wl-clipboard
    ];

    imports = with self.homeModules; [
      hyprlock
      wleave
    ];
    
    programs.btop.enable = true;
    catppuccin.btop.enable = true;
    catppuccin.btop.flavor = "mocha";
  };
}
