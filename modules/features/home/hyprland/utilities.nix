{ inputs, ... }: {
  flake.homeModules.hypr-utilities = { pkgs, ... }: {
    home.packages = with pkgs; [
      bluetui
      hyprpicker
      impala
      wl-clipboard
    ];

    programs.btop.enable = true;
    catppuccin.btop.enable = true;
    catppuccin.btop.flavor = "mocha";

    programs.wlogout = {
      enable = true;
      layout = [
        {
          keybind = "l";
          label = "lock";
          text = "Lock";
        }
        {
          action = "uwsm stop";
          keybind = "x";
          label = "logout";
          text = "Logout";
        }
        {
          action = "systemctl poweroff";
          keybind = "q";
          label = "shutdown";
          text = "Shutdown";
        }
        {
          action = "systemctl reboot";
          keybind = "r";
          label = "restart";
          text = "Restart";
        }
      ];

      style = "${inputs.self}/assets/wlogout/style.css";
    };
  };
}
