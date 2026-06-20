{ ... }: {
  flake.homeModules.cursor = { pkgs, ... }: {
    home.pointerCursor = {
      gtk.enable = true;
      hyprcursor.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };
  };
}
