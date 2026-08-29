{ inputs, ... }: {
  flake.homeModules.wlogout = {
    programs.wlogout = {
      enable = true;
      layout = [
        {
          label = "lock";
          text = "Lock";
          keybind = "l";
          action = "sleep 0.3 && loginctl lock-session";
        }
        {
          label = "suspend";
          text = "Suspend";
          keybind = "s";
          action = "sleep 0.3 && systemctl suspend";
        }
        {
          label = "logout";
          text = "Logout";
          keybind = "x";
          action = "uwsm stop";
        }
        {
          label = "shutdown";
          text = "Shutdown";
          keybind = "q";
          action = "systemctl poweroff";
        }
        {
          label = "reboot";
          text = "Restart";
          keybind = "r";
          action = "systemctl reboot";
        }
      ];
    };   

    xdg.configFile."wlogout" = {
      source = "${inputs.self}/assets/wlogout";
      recursive = true;
    };
  };
}
