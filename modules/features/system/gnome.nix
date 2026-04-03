{
  flake.nixosModules.gnome = { lib, pkgs, ... }: {
    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      gnome.core-apps.enable = false;
    };
    documentation.nixos.enable = false;
    
    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
    ];

    environment.systemPackages = [
      (lib.hiPrio (pkgs.runCommand "helix-desktop-hide" { } ''
        mkdir -p "$out/share/applications"
        cat "${pkgs.helix}/share/applications/Helix.desktop" > "$out/share/applications/Helix.desktop"
        echo "Hidden=1" >> "$out/share/applications/Helix.desktop"
      ''))
      (lib.hiPrio (pkgs.runCommand "gnome-extensions-desktop-hide" { } ''
        mkdir -p "$out/share/applications"
        cat "${pkgs.gnome-shell}/share/applications/org.gnome.Shell.Extensions.desktop" > "$out/share/applications/org.gnome.Shell.Extensions.desktop"
        echo "Hidden=1" >> "$out/share/applications/org.gnome.Shell.Extensions.desktop"
      ''))
    ];
  };
}
