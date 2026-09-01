{
  flake.homeModules.battery = {
    services.batsignal = {
      enable = true;
      extraArgs = [
        "-w 30"
        "-c 10"
        "-d 5"
      ];
    };
  };
}
