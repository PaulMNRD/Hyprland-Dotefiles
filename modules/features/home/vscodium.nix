{ inputs, ... }: {
  flake.homeModules.vscodium = { pkgs, ... }: { 
      home.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
      ];

      programs.vscodium = {
        enable = true;
        package = pkgs.vscodium-fhs;

        profiles.default = {
          extensions = with pkgs.vscode-extensions; [
            catppuccin.catppuccin-vsc
            pkief.material-icon-theme
            # vscodevim.vim
          ] ++ (with pkgs.nix-vscode-extensions.open-vsx; [
            gregoire.dance
          ]);

          userSettings = {
            "breadcrumbs.enabled" = false;
            "editor.cursorBlinking" = "expand";
            "editor.cursorSmoothCaretAnimation" = "on";
            "editor.fontFamily" = "JetBrainsMono Nerd Font";
            "editor.fontLigatures" = true;
            "editor.minimap.enabled" = false;
            "editor.scrollbar.horizontal" = "hidden";
            "editor.scrollbar.horizontalScrollbarSize" = 0;
            "editor.scrollbar.vertical" = "hidden";
            "editor.scrollbar.verticalScrollbarSize" = 0;
            "explorer.confirmDelete" = false;
            "files.autoSave" = "afterDelay";
            "files.autoSaveDelay" = 5000;
            "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
            "terminal.integrated.stickyScroll.enabled" = false;
            "window.titleBarStyle" = "native";
            "window.commandCenter" = false;
            "window.customTitleBarVisibility" = "never";
            "window.menuBarVisibility" = "hidden";
            "workbench.activityBar.location" = "hidden";
            "workbench.editor.editorActionsLocation" = "hidden";
            "workbench.colorTheme" = "Catppuccin Mocha";
            "workbench.iconTheme" = "material-icon-theme";
            "workbench.sideBar.location" = "right";
            "workbench.statusBar.visible" = false;
            
            "dance.modes" = {
              normal = {
                cursorStyle = "block";
                decorations.backgroundColor = null;
              };
            };
          };
        };
      };
    };
}
