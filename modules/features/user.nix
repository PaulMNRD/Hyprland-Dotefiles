{
  flake.nixosModules.user = { pkgs, ... }: {
    programs.fish.enable = true;
    users.users.paul = {
      isNormalUser = true;
      description = "Paul";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.fish;
    };
  };
}
