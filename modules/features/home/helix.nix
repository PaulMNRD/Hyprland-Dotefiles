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
        keys.normal = {
          "C-s" = ":w";
          "C-q" = ":bc";
          "C-t" = ":sh kitty --working-directory . > /dev/null 2>&1 &";
          "C-v" = ":sh copilot -p '%{selection}'";
        };
      };
    };

    programs.github-copilot-cli.enable = true;
    programs.librewolf.enable = true;
  };
}
