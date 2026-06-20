{ inputs, ... }: {
  flake.nixosModules.sddm = { pkgs, ... }:
    let
        wallpaper = "${inputs.self}/assets/wallpapers/lofi-cat.jpg";
        avatar = "${inputs.self}/assets/avatar.png";
    in {
      services.xserver.enable = true;
      services.displayManager.sddm = {
        enable = true;
        # wayland.enable = true;
        theme = "pixie";
        # package = pkgs.kdePackages.sddm;

        extraPackages = with pkgs; [
          kdePackages.qtdeclarative
          kdePackages.qtsvg
          kdePackages.qt5compat
        ];
      };

      environment.systemPackages = [
        (inputs.pixie-sddm.packages.${pkgs.stdenv.hostPlatform.system}.pixie-sddm.override {
          background = wallpaper;
          avatar = avatar;
        })
      ];
    };
}
