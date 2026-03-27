{
  flake.nixosModules.sddm = { pkgs, ... }: {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      extraPackages = with pkgs; [
        kdePackages.qtmultimedia
        kdePackages.qtsvg
        kdePackages.qtvirtualkeyboard
        kdePackages.qtbase
      ];
    };
  };
}
