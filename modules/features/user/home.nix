{
  flake.homeModules.home = { preferences, ... }:
  let
    username = preferences.user.name;
  in {
    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "25.11";
  };
}
