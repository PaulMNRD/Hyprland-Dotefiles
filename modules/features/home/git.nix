{
  flake.homeModules.git = { preferences, ... }:
  let
    fullName = preferences.user.fullName;
    email = preferences.user.email;
  in {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = fullName;
          email = email;
        };
        init.defaultBranch = "main";
        push = { autoSetupRemote = true; };
      };
    };
  };
}