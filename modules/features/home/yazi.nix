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
  };
}
