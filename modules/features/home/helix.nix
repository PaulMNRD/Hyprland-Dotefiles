{
  flake.homeModules.helix = { pkgs, ... }: {
    programs.helix = {
      enable = true;
      
      themes = {
        default = {
          inherits = "catppuccin_frappe";
          "ui.background" = { };
        }; 
      };
      
      settings = {
        theme = "default";
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
  };
}
