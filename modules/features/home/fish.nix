{ ... }: {
  flake.homeModules.fish = { ... }: {
    programs.fish = {
      enable = true;
      shellInit = ''
        set fish_greeting
      '';
    };
  };
}
