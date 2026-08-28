{ inputs, ... }: {
  flake.homeModules.zen-browser = {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    programs.zen-browser.enable = true;
  };
}
