{ ... }: {
  flake.homeModules.java = { pkgs, ... }: {
    programs.java = {
      enable = true;
      package = pkgs.jdk25;
    };

    home.packages = with pkgs; [
      jdt-language-server
      maven
    ];
  };
}
