{ inputs, ... }: {
  flake.homeModules.awww = { pkgs, ... }:
  let
      wallpaper = "${inputs.self}/assets/wallpapers/piano-anime.png";
  in {
    services.awww.enable = true;

    systemd.user.services.awww-wallpaper = {
      Unit = {
        Description = "Set wallpaper via awww";
        After = [ "awww.service" ];
        Wants = [ "awww.service" ];
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.awww}/bin/awww img ${wallpaper}";
      };
      Install.WantedBy = [ "awww.service" ];
    };
  };
}
