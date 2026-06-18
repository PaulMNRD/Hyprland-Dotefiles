{ inputs, ... }: {
  flake.nixosModules.nix = {
    nixpkgs = {
      config.allowUnfree = true;
      overlays = [ inputs.nix-vscode-extensions.overlays.default ];
    };
        
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    nix.settings.auto-optimise-store = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
