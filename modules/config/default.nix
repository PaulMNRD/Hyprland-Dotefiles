{ lib, ... }: {
  flake.nixosModules.options = { lib, ... }: {
    options.preferences = {
      user = {
        name = lib.mkOption {
          type = lib.types.str;
          default = "paul";
        };

        fullName = lib.mkOption {
          type = lib.types.str;
          default = "Paul Menard";
        };

        email = lib.mkOption {
          type = lib.types.str;
          default = "paulmenard07104@gmail.com";
        };
      };
      
      hostname = lib.mkOption {
        type = lib.types.str;
      };

      homeModules = lib.mkOption {
        type = lib.types.listOf lib.types.deferredModule;
        default = [];
      };
    };
  };
}