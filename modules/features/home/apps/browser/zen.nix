{ self, inputs, ... }: {
  flake.homeModules.zen-browser = {
    imports = [
      inputs.zen-browser.homeModules.beta
      self.homeModules.zen-policies
    ];
    
    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
      
      profiles.default = {
        presets.betterfox.enable = true;
        presets.catppuccin = {
          enable = true;
          flavor = "Mocha";
          accent = "Mauve";
        };

        settings = {
          "zen.welcome-screen.seen" = true;
          "zen.pinned-tab-manager.restore-pinned-tabs-to-pinned-url" = true;
          "browser.tabs.warnOnClose" = false;
          "browser.tabs.hoverPreview.enabled" = true;
          "browser.sessionstore.restore_from_crash" = false;
          "browser.ctrlTab.sortByRecentlyUsed" = true;
          "browser.translations.enable" = false;
          "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
          "middlemouse.paste" = false;
        };

        containersForce = true;
        containers = {
          Work = {
            color = "blue";
            icon = "briefcase";
            id = 1;
          };
        };

        spacesForce = true;
        spaces =
          let
            mantle-theme = {
              colors = [
                {
                  red = 24;
                  green = 24;
                  blue = 37;
                }
              ];
              opacity = 1.0;
            };
          in {
            "Home" = {
              id = "1aa86032-96b1-4ea4-9f77-f28a23aac1f4";
              position = 1000;
              icon = "🏠";
              theme = mantle-theme;

              pins = {
                "Youtube" = {
                  id = "1d8252cd-e12e-49b9-b1e6-df48cb33fba3";
                  url = "https://www.youtube.com";
                  position = 100;
                };
                "Twitch" = {
                  id = "08792259-a29e-4170-a197-5e1526b1ced4";
                  url = "https://www.twitch.tv";                
                  position = 200;
                };
                "Anime-Sama" = {
                  id = "65b536f8-13f4-4315-ba51-da4c617a4dab";
                  url = "https://anime-sama.to";
                  position = 300;
                };
              };
            };

          "Work" = {
            id = "9d1f9857-43b2-4b4c-80d4-dd53a1198686";
            position = 2000;
            icon = "💼";
            container = 1;
            theme = mantle-theme;
          };

          "Dev" = {
            id = "30e98a17-0e07-471e-b69b-76ce01982c8a";
            position = 3000;
            icon = "💻";
            container = 1;
            theme = mantle-theme;

            pins = {
              "Catppuccin" = {
                id = "bdd59d61-a045-4389-8d4b-7f36b7822a84";
                url = "https://catppuccin.com";
                position = 700;
              };
            };
          };
        };

        pins = {
          "Github" = {
            id = "3ad4b669-86b6-4e16-b336-3ca598b75c90";
            url = "https://github.com";
            position = 400;
            isEssential = true;
            container = 1;
          };

          "Email" = {
            id = "e3ab5f06-391e-4344-bda2-99c4ee9eccf7";
            url = "https://mail.proton.me";
            position = 500;
            isEssential = true;
            container = 1;
          };

          "Drive" = {
            id = "6b954db7-d691-4eaa-993a-77400cedef6a";
            url = "https://drive.proton.me";
            position = 600;
            isEssential = true;
            container = 1;
          };
        };
      };
    };
  };
}
