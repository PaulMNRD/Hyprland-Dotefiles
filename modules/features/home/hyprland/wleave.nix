{ inputs, ... }: {
  flake.homeModules.wleave = {
    programs.wleave = {
      enable = true;
      style = builtins.readFile "${inputs.self}/assets/wleave/style.css";
      settings = {
        margin = 100;
        buttons-per-row = "5";
        close-on-lost-focus = true;
        no-version-info = true;
        delay-command-ms = 300;
        buttons = [
          {
            label = "lock";
            text = "Lock";
            keybind = "l";
            action = "loginctl lock-session";
            icon = "${inputs.self}/assets/wleave/icons/lock.svg";
          }
          {
            label = "suspend";
            text = "Suspend";
            keybind = "s";
            action = "systemctl suspend";
            icon = "${inputs.self}/assets/wleave/icons/suspend.svg";
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
            keybind = "q";
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
