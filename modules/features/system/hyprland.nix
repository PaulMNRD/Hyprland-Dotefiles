{ self, ... }: {
  flake.nixosModules.hyprland = { pkgs, ... }: {
    preferences.homeModules = [ self.homeModules.hyprland ];
    
    imports = with self.nixosModules; [
      sddm  
    ];

    environment.systemPackages = with pkgs; [
      impala
      bluetui
    ];
    
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true; 
    };
  };
}
