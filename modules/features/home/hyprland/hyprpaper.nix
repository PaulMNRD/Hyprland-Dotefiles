{ inputs, ... }: {
  flake.homeModules.hyprpaper = { ... }:
  let
    wallpaper = "${inputs.self}/assets/wallpapers/test-pic.jpg";
  in {
    services.hyprpaper = {
      enable = true;
      settings = {
        splash = false;
        wallpaper = [{
          monitor= "";
          path = wallpaper;
        }];
      };
    };
  };
}