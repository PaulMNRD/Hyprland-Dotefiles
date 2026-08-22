{
  flake.homeModules.terminal = { lib, ... }: {
    programs.ptyxis.enable = true;

    dconf.settings = {
      "org/gnome/Ptyxis" = {
        audible-bell = false;
        default-columns = lib.hm.gvariant.mkUint32 130;
        default-profile-uuid = "7e0b977be9b422b52c3240156a885a4e";
        default-rows = lib.hm.gvariant.mkUint32 35;
        profile-uuids = [ "7e0b977be9b422b52c3240156a885a4e" ];
        restore-session = false;
        restore-window-size = false;
        use-system-font = false;
        custom-font = "JetBrainsMono Nerd Font";
      };
      "org/gnome/Ptyxis/Profiles/7e0b977be9b422b52c3240156a885a4e" = {
        palette = "Catppuccin Mocha";
      };
    };

    xdg.desktopEntries."org.gnome.Ptyxis" = {
      name = "Terminal";
      genericName = "Terminal";
      exec = "ptyxis";
      icon = "org.gnome.Ptyxis";
      categories = [ "System" "TerminalEmulator" ];
      terminal = false;
    };
  };
}
