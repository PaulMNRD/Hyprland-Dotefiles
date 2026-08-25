{ ... }: {
  flake.homeModules.cursor = { pkgs, ... }: {
    home.pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      hyprcursor.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
  };
}
