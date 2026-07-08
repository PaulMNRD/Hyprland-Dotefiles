{ ... }: {
  flake.homeModules.Java = { pkgs, ... }: {
    programs.java = {
      enable = true;
      package = pkgs.jdk25;
    };

    home.packages = [ pkgs.jdt-language-server ];
  };
}
