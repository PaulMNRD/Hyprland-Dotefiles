{ inputs, ... }: {
  flake.homeModules.quickshell = { pkgs, ... }: {
    programs.quickshell = {
      enable = true;
      package = pkgs.quickshell;

      configs = {
        default = "${inputs.self}/assets/quickshell";
      };
:
      activeConfig = "default";

      systemd = {
        enable = true;
        target = "hyprland-session.target";
      };
    };

    home.packages = with pkgs; [
      kdePackages.qtwayland
      kdePackages.qtsvg
      kdePackages.qtimageformats
      kdePackages.qtmultimedia
      kdePackages.qt5compat
    ];
  };
}