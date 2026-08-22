{ ... }: {
  flake.homeModules.fish = { ... }: {
    programs.fish = {
      enable = true;
      shellInit = ''
        set fish_greeting
      '';
    };

    catppuccin.fish.enable = true;
    catppuccin.fish.flavor = "mocha";
  };
}
