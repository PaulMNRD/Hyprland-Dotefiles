{ inputs, ... }: {
  flake.nixosModules.sddm = { pkgs, ... }:
    let
        wallpaper = "${inputs.self}/assets/wallpapers/outer-wilds.png";
        avatar = "${inputs.self}/assets/avatar.png";
    in {
      services.displayManager.sddm = {
        wayland.enable = true;
        enable = true;
        theme = "catppuccin-mocha-mauve";
        package = pkgs.kdePackages.sddm;
      };

      environment.systemPackages = [(
          pkgs.catppuccin-sddm.override {
            flavor = "mocha";
            accent = "mauve";
            background = wallpaper;
            loginBackground = true;
            userIcon = true;
          }
        )];
    };
}
