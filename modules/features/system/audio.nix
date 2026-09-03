{
  flake.nixosModules.audio = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      playerctl
      pavucontrol
    ];
    
    services.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    security.rtkit.enable = true;
    nixpkgs.config.pulseaudio = true;
  };
}
