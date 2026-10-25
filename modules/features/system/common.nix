{ self, inputs, ... }: {
  flake.nixosModules.common = { pkgs, ... }: {
    imports = with self.nixosModules; [
      options

      audio
      android-dev
      bluetooth
      boot
      hyprland
      keyboard
      localization
      logind
      networking
      nix
      steam
      user
      virtualisation
    ];

    preferences.homeModules = with self.homeModules; [
      apps
      fish
      git
      home
      starship
    ];

    environment.sessionVariables = { EDITOR = "hx"; VISUAL = "hx"; };

    environment.systemPackages = (with pkgs; [
      unstable.devenv
      unstable.zed-editor-fhs
      unstable.opencode
      chromium
      lunar-client
      git
    ]) ++ [
      (inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
        enableYaziIntegration = true;
      })
    ];

    system.stateVersion = "26.05";
  };
}
