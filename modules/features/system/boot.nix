{
  flake.nixosModules.boot = {
    boot = {
      plymouth.enable = true; 
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
