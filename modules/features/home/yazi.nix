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
      name = "File Explorer";
      genericName = "File Manager";
      exec = "kitty --title Explorer yazi %u";
      icon = "system-file-manager";
      terminal = false;
      categories = [ "System" "FileManager" ];
      mimeType = [ "inode/directory" ];
    };
  };
}
