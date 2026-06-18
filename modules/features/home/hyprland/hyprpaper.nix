{ inputs, ... }: {
  flake.homeModules.hyprpaper = { pkgs, ... }:
  let
    wallpaper = "${inputs.self}/assets/wallpapers/lofi-cat.jpg";
  in {
    services.hyprpaper = {
      enable = true;
      settings = {
        splash = false;
        wallpaper = [{
          monitor = "";
          path = wallpaper;
        }];
      };
    };
  };
}