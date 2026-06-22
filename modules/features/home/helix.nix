{
  flake.homeModules.helix = { pkgs, ... }: {
    
    home.sessionVariables = {
      EDITOR = "hx";
    };
    
    programs.helix = {      
      enable = true;
      
      settings = {
        theme = "catppuccin_mocha";
        editor.line-number = "relative";
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
  };
}
