{
  flake.homeModules.yazi = { pkgs, ... }: {
    programs.yazi = {
      enable = true;
      enableFishIntegration = true;
    };

    catppuccin.yazi = {
      enable = true;
      flavor = "mocha";
      accent = "mauve";
    };

    xdg.desktopEntries."yazi" = {
      name = "Yazi File Manager";
      noDisplay = true;
    };

    xdg.configFile."xdg-desktop-portal-termfilechooser/config".text = ''
      [filechooser]
      cmd=kitty --title "Explorer" yazi
      default_dir=$HOME
    '';
  };
}
