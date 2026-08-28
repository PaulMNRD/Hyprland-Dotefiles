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

    # services.polkit-gnome.enable = true;
    services.hyprlauncher.enable = true;
    services.hyprpolkitagent = {
      enable = true;
      package = inputs.hyprpolkitagent.packages.${pkgs.stdenv.hostPlatform.system}.hyprpolkitagent;
    };
    xdg.configFile."hypr/hyprtoolkit.conf".text = ''
      background = "0xCC11111B"
      base = "0xCC1E1E2E"
      text = "0xFFCDD6F4"
      alternate_base = "0xCC181825"
      bright_text = "0xFFF5E0DC"
      accent = "0xFFCBA6F7"
      accent_secondary = "0xFFCBA6F7"
      font_size = 14
      small_font_size = 12
      h3_size = 16
      h2_size = 18
      h1_size = 20
      font_family = "JetBrainsMono Nerd Font"
      font_family = "JetBrainsMono Nerd Font"
      rounding_large = 20
      rounding_small = 10
    '';
    
    programs.btop.enable = true;
    catppuccin.btop.enable = true;
    catppuccin.btop.flavor = "mocha";
  };
}
