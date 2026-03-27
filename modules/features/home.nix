{
  flake.homeModules.home = {
    home.username = "paul";
    home.homeDirectory = "/home/paul";
    home.stateVersion = "25.11";

    programs.git = {
      enable = true;
      userName = "Paul";
      userEmail = "paul@example.com";
    };
  };
}
