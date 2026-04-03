{
  flake.nixosModules.gnome = { pkgs, ... }: {
    services = {
      desktopManager.gnome.enable = true;
    };

    environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];
  };
}