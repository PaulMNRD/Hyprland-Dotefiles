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

    services.awww.enable = true;
    
    services.polkit-gnome.enable = true;
    services.udiskie.enable = true;

    programs.btop.enable = true;
    catppuccin.btop.enable = true;
    catppuccin.btop.flavor = "mocha";

    xdg.desktopEntries."btop" = {
      name = "System Monitor";
      genericName = "System Monitor";
      exec = "kitty --title \"System Monitor\" btop";
      icon = "system-monitor";
      terminal = false;
      categories = [ "System" "Monitor" ];
    };
    xdg.desktopEntries."impala" = {
      name = "Wifi Settings";
      genericName = "Wifi Manager";
      exec = "kitty --title \"System Settings\" impala";
      icon = "network-wireless";
      terminal = false;
      categories = [ "System" "Network" ];
    };
    xdg.desktopEntries."bluetui" = {
      name = "Bluetooth Settings";
      genericName = "Bluetooth Manager";
      exec = "kitty --title \"Bluetooth Settings\" bluetui";
      icon = "bluetooth";
      terminal = false;
      categories = [ "System" "Network" ];
    };
  };
}
