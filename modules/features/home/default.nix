{
  flake.homeModules.home = { preferences, ... }:
  let
    username = preferences.user.name;
  in {
    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "26.05";
  };
}
