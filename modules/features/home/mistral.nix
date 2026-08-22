{
  flake.homeModules.mistral = { pkgs, ... }: {
    home.packages = [ pkgs.mistral-vibe ];
  };
}
