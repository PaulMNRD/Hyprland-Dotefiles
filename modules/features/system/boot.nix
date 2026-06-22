{ ... }: {
  flake.nixosModules.boot = { pkgs, ... }: {
    boot = {
      # plymouth = {
      #   enable = true;
      #   theme = "splash";
      #   themePackages = with pkgs; [
      #     (adi1090x-plymouth-themes.override {
      #       selected_themes = [ "splash" ];
      #     })
      #   ];
      # }; 
      consoleLogLevel = 3;
      initrd.verbose = false;
      loader.timeout = 0;
      kernelParams = [
        "quiet"
        "rd.udev.log_level=3"
        "rd.systemd.show_status=auto"
        "vt.global_cursor_default=0"
      ];
    };
  };
}
