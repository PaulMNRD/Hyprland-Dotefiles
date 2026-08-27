{ self, ... }: {
  flake.nixosModules.hyprland = { pkgs, ... }: {
    preferences.homeModules = [ self.homeModules.hyprland ];
    
    imports = with self.nixosModules; [
      sddm  
    ];

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true; 
    };

    security.pam.services.hyprlock = {};
  };
}
