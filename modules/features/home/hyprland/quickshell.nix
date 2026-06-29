{ inputs, ... }: {
  flake.homeModules.quickshell = { pkgs, ... }: {
    programs.quickshell = {
      enable = true;
      package = pkgs.quickshell;

      configs = {
        default = "${inputs.self}/assets/quickshell";
      };

      activeConfig = "default";

      systemd = {
        enable = true;
        target = "hyprland-session.target";
      };
    };

    home.packages = with pkgs; [
        qt6.qtdeclarative
        qt6.qtwayland
        qt6.qtsvg
        qt6.qtimageformats
        qt6.qtmultimedia
        qt6.qt5compat
    ];
  };
}
