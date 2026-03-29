{ inputs, ... }: {
  flake.homeModules.hyprpaper = { ... }:
  let
    wallpaper = "${inputs.self}/assets/wallpapers/outer-wilds.png";
  in {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ wallpaper ];
        wallpaper = [ ", ${wallpaper}" ];
      };
    };
  };
}