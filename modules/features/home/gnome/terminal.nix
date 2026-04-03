{
  flake.homeModules.terminal = { pkgs, ... }: {
    home.packages = [ pkgs.gnome-terminal ];
  };
}