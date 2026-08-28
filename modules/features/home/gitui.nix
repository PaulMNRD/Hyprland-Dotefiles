{
  flake.homeModules.gitui = {
    programs.gitui.enable = true;
    catppuccin.gitui = {
      enable = true;
      flavor = "mocha";
    };
  };
}
