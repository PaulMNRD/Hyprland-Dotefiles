{
  flake.homeModules.screenshot = { pkgs, ...}: {
    home.packages = with pkgs; [
      grim
      slurp
    ];

    home.file."Pictures/Screenshots/.keep".source = builtins.toFile "keep" "";

    programs.satty = {
      enable = true;
      settings.general = {
        copy-command = "wl-copy";
        output-filename = "~/Pictures/Screenshots/%Y%m%d_%H%M%S.png";
        disable-notifications = true;
        actions-on-enter = [
          "save-to-file"
          "save-to-clipboard"
          "exit"
        ];
      };
    };
  };
}
