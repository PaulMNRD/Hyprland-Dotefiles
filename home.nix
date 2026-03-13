{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";
  home.username = "paul";
  home.homeDirectory = "/home/paul";

  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_frappe";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
  };
  
  programs.firefox.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
        set -U fish_greeting ""
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Paul Menard";
        email = "paulmenard07104@gmail.com";
      };
      init.defaultBranch = "main";
      push = { autoSetupRemote = true; };
    };
  };

  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      font_size = 8;
    };
    themeFile = "Catppuccin-Frappe";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-termfilechooser
    ];
    config.common = {
      default = [ "hyprland" ];
      "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
    };
    config.hyprland = {
      default = [ "hyprland" ];
      "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
    };
  };

  home.sessionVariables.TERMCMD = "kitty --class=filechoose_yazi";

  xdg.configFile."xdg-desktop-portal-termfilechooser/config" = {
    force = true;
    text = ''
      [filechooser]
      cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
    '';
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    plugins = [ ];

    settings = {
      misc = {
        disable_hyprland_logo = true;
      };

      bind = [
        "SUPER, T, exec, kitty"
      ];
    };
  };

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
}
