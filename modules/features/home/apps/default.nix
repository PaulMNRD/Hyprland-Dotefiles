{ self, ... }: {
  flake.homeModules.apps = { pkgs, ... }: {
    imports = with self.homeModules; [
      vscodium
      zen-browser
    ];

    home.packages = with pkgs; [
      ytmdesktop
    ];

    programs.discord.enable = true;
  };
}
