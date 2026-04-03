{
  flake.homeModules.helix = { pkgs, ... }: {
    programs.helix = {
      enable = true;
      
      settings = {
        theme = "catppuccin_frappe";
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
  };
}
