{ self, ... }: {
  flake.homeModules.apps = { pkgs, ... }: {
    imports = with self.homeModules; [
      vscodium
      zen-browser
    ];

    home.packages = with pkgs; [
      ytmdesktop
      signal-desktop
    ];

    programs.discord.enable = true;
    programs.obsidian.enable = true;
  };
}
