{ self, ... }: {
  flake.homeModules.helix = { pkgs, ... }: {
    imports = with self.homeModules; [
      yazi
      gitui
    ];
    
    home.packages = with pkgs; [
      nixd
    ];
    
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
          "space" = {
            "e" = [
              ":sh rm -f /tmp/unique-file"
              ":insert-output yazi --chooser-file=/tmp/unique-file"
              ":insert-output echo \"\\x1b[?2004h\" > /dev/tty"
              ":open %sh{cat /tmp/unique-file}"
              ":redraw"
            ];
            "E" = [
              ":sh rm -f /tmp/unique-file"
              ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
              ":insert-output echo \"\\x1b[?2004h\" > /dev/tty"
              ":open %sh{cat /tmp/unique-file}"
              ":redraw"
            ]; 
          };
          "C-s" = ":w";
          "C-q" = ":bc";
          "C-t" = ":sh kitten @ launch --no-response --type=tab --cwd=current &> /dev/null";
          "C-g" = ":sh kitten @ launch --no-response --type=tab --cwd=current --tab-title=Git gitui &> /dev/null";
        };
      };
    };

    xdg.desktopEntries."Helix" = {
      name = "Helix";
      noDisplay = true;
    };
  };
}
