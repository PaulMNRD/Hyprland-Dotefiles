{
  flake.homeModules.waybar = {
    programs.waybar = {
      enable = true;
      systemd = {
        enable = true;
      };
      
      settings.mainBar = {
        reload_style_on_change = true;
        layer = "top";
        position = "top";
        spacing = 0;
        height = 26;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "mpris"
          "tray"
          "memory"
          "backlight"
          "network"
          "bluetooth"
          "pulseaudio"
          "cpu"
          "battery"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          cursor = true;
          format = "{icon}";
          persistent-workspaces = {
            "*" = 5;
          };
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 45;
        };

        cpu = {
          interval = 5;
          format = "󰍛";
          on-click = "kitty btop";
        };

        clock = {
          format = "{:%I:%M %p}";
          format-alt = "{:%A %d/%m/%Y}";
          tooltip-format = "<span>{calendar}</span>";
        };

        network = {
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
          format = "{icon} {essid}";
          format-wifi = "{icon} {essid}";
          format-ethernet = "󰀂";
          format-disconnected = "󰤮";
          tooltip-format-wifi = "{essid} ({frequency} GHz)\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-ethernet = "⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-disconnected = "Disconnected";
          interval = 3;
          spacing = 1;
          on-click = "nm-connection-editor";
        };

        battery = {
          format = "{capacity}% {icon}";
          format-discharging = "{capacity}% {icon}";
          format-charging = "{capacity}% {icon}";
          format-plugged = "";
          format-icons = {
            charging = [ "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
            default = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          };
          format-full = "󰂅";
          tooltip-format-discharging = "{power:>1.0f}W↓ {capacity}%";
          tooltip-format-charging = "{power:>1.0f}W↑ {capacity}%";
          interval = 5;
          on-click = "wlogout";
          states = {
            warning = 20;
            critical = 10;
          };
        };

        bluetooth = {
          format = "";
          format-off = "󰂲";
          format-disabled = "󰂲";
          format-connected = "";
          format-no-controller = "";
          tooltip-format = "Devices connected: {num_connections}";
          on-click = "blueman-manager";
        };

        pulseaudio = {
          format = "{icon}";
          on-click = "pavucontrol";
          on-click-right = "pamixer -t";
          tooltip-format = "Playing at {volume}%";
          scroll-step = 5;
          format-muted = "";
          format-icons = {
            headphone = "";
            headset = "";
            default = [ "" "" "" ];
          };
        };

        backlight = {
          format = "{percent}% {icon}";
          format-icons = [ "🌑" "🌘" "🌗" "🌖" "🌕" ];
        };

        memory = {
          format = " {used:0.1f}gb";
          interval = 2;
          on-click = "kitty btop";
        };

        tray = {
          icon-size = 14;
          spacing = 6;
        };

        mpris = {
          format = "{player_icon} {artist} - {title}";
          format-paused = "{status_icon} <i>{artist} - {title}</i>";
          ignored-players = [ "chromium" ];
          max-length = 35;
          player-icons = {
            default = "🎵";
            mpv = "🎵";
          };
          status-icons = {
            paused = "⏸";
          };
        };
      };

      style = ''
        * {
          border: none;
          border-radius: 0;
          min-height: 0;
          font-family: 'JetBrainsMono Nerd Font';
          font-size: 14px;
        }

        .modules-left,
        .modules-center,
        .modules-right {
          background-color: alpha(#cdd6f4, 0.05);
          border-radius: 20px;
          padding: 0px 5px;
          margin: 10px 5px;
          min-height: 30px;
        }

        .modules-left {
          margin-left: 5px;
        }

        .modules-right {
          margin-right: 5px;
        }

        window#waybar {
          background: transparent;
        }

        window#waybar.empty #window {
          background: transparent;
          color: transparent;
          padding: 0;
          margin: 0;
          transition: .5s;
        }

        mpris.empty {
          background: transparent;
          padding: 0;
          margin: 0;
        }

        #workspaces {
          background-color: alpha(#cdd6f4, .05);
          border: none;
          padding: 0px;
          margin: 5px 6px;
          margin-right: 0px;
          border-radius: 15px;
        }

        #workspaces button {
          padding: 0px 8px;
          margin: 0px 2px;
          color: #1e1e2e;
          border-radius: 15px;
          background-color: alpha(#cdd6f4, .4);
        }

        #workspaces button.active {
          padding: 0px 8px;
          margin: 0px 2px;
          background: #cdd6f4;
          color: #1e1e2e;
          border-radius: 15px;
          opacity: 1;
        }

        #workspaces button.empty {
          opacity: 0.2;
        }

        #workspaces button.empty.active {
          opacity: 0.75;
        }

        #workspaces button.active:hover,
        #workspaces button:hover {
          background-color: alpha(#cdd6f4, .3);
          color: #1e1e2e;
          opacity: 1;
          transition: .7s;
        }

        #custom-weather,
        #memory,
        #mpris,
        #window,
        #clock,
        #cpu,
        #battery,
        #network,
        #bluetooth,
        #pulseaudio,
        #backlight,
        #tray {
          background-color: alpha(#cdd6f4, 0.1);
          padding: 5px 12px;
          margin: 5px 0;
          border-radius: 0;
        }

        #mpris:hover,
        #window:hover,
        #clock:hover,
        #backlight:hover,
        #cpu:hover,
        #network:hover,
        #bluetooth:hover,
        #pulseaudio:hover {
          background-color: alpha(#cdd6f4, .2);
          transition: .7s;
        }

        #tray,
        #memory,
        #custom-weather {
          background-color: transparent;
          margin: 5px;
          padding: 0 2px;
        }

        #clock {
          border-radius: 15px;
          padding: 0 15px;
          margin: 5px 0px;
          background-color: transparent;
        }

        .hidden {
          opacity: 0;
        }

        #battery {
          background-color: #cdd6f4;
          color: #1e1e2e;
          min-width: 10px;
          border-radius: 15px;
          padding: 0 8px;
          margin: 5px 0 5px 0px;
        }

        #battery.warning {
          background-color: #fab387;
          color: #1e1e2e;
        }

        #battery.critical {
          background-color: #f38ba8;
          color: #1e1e2e;
        }

        #mpris,
        #window {
          border-radius: 15px;
          padding: 5px 10px;
          margin-right: 0px;
        }

        #window {
          margin-left: 5px;
        }

        #backlight {
          background-color: alpha(#cdd6f4, .1);
          border-radius: 15px;
          padding: 5px 10px;
          margin: 5px;
        }

        #network {
          border-radius: 15px 0 0 15px;
        }

        #cpu {
          padding: 0 15px 0 10px;
          border-radius: 0 15px 15px 0;
          margin-right: 0px;
        }

        #pulseaudio {
          padding: 0 15px 0 10px;
        }

        tooltip {
          border-radius: 15px;
          background: #1e1e2e;
          border: 2px solid alpha(#cdd6f4, .5);
        }
      '';
    };
  };
}
