{
  flake.homeModules.fish = { ... }: {
    programs.fish = {
      enable = true;
      shellInit = ''
        set fish_greeting
        devenv hook fish | source
      '';
    };

    catppuccin.fish.enable = true;
    catppuccin.fish.flavor = "mocha";
  };
}
