{ self, inputs, ... }: {
  flake.homeModules.hyprland = { pkgs, ... }: {
    imports = with self.homeModules; [ 
      awww
      cursor
      #hyprpaper
      kitty
      # quickshell
      hypr-utilities
    ];

    home.packages = with pkgs; [
      acpi
    ];

     wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
    };

    xdg.configFile."hypr" = {
      source = "${inputs.self}/assets/hyprland";
      recursive = true;
    };

    programs.wleave = {
      enable = true;
      style = builtins.readFile "${inputs.self}/assets/wleave/style.css";
      settings = {
        margin = 200;
        buttons-per-row = "4";
        close-on-lost-focus = true;
        buttons = [
          {
            label = "lock";
            text = "Lock";
            keybind = "l";
            action = "";
            icon = "${inputs.self}/assets/wleave/icons/lock.svg";
          }
          {
            label = "logout";
            text = "Logout";
            keybind = "x";
            action = "uwsm stop";
            icon = "${inputs.self}/assets/wleave/icons/logout.svg";
          }
          {
            label = "shutdown";
            text = "Shutdown";
            keybind = "s";
            action = "systemctl poweroff";
            icon = "${inputs.self}/assets/wleave/icons/shutdown.svg";
          }
          {
            label = "reboot";
            text = "Restart";
            keybind = "r";
            action = "systemctl reboot";
            icon = "${inputs.self}/assets/wleave/icons/reboot.svg";
          }
        ];
      };
    };
  };
}
