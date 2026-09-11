{ inputs, ... }: {
  flake.homeModules.zen-browser = { pkgs, ... }: {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];
    
    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
      policies = let
        mkExtensionSettings = builtins.mapAttrs (_: pluginId: {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
          installation_mode = "force_installed";
        });
      in {
        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisableTelemetry = true;
        DisablePocket = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        SanitizeOnShutdown = {
          FormData = true;
          Cache = true;
        };

        ExtensionSettings = mkExtensionSettings {
          "78272b6fa58f4a1abaac99321d503a20@proton.me" = "proton-pass";
          "uBlock0@raymondhill.net" = "ublock-origin";
        };

        "3rdparty".Extensions."uBlock0@raymondhill.net".toOverwrite = {
          filterLists = [
            "user-filters"
            "ublock-filters"
            "ublock-badware"
            "ublock-privacy"
            "ublock-quick-fixes"
            "ublock-unbreak"
            "easylist"
            "adguard-generic"
            "adguard-mobile"
            "easyprivacy"
            "adguard-spyware-url"
            "block-lan"
            "urlhaus-1"
            "curben-phishing"
            "plow-0"
            "dpollock-0"
            "fanboy-cookiemonster"
            "ublock-cookies-easylist"
            "ublock-cookies-adguard"
            "fanboy-social"
            "adguard-social"
            "fanboy-thirdparty_social"
            "fanboy-ai-suggestions"
            "easylist-chat"
            "easylist-newsletters"
            "easylist-notifications"
            "easylist-annoyances"
            "adguard-mobile-app-banners"
            "adguard-other-annoyances"
            "adguard-popup-overlays"
            "adguard-widgets"
            "ublock-annoyances"
            "ALB-0"
            "BGR-0"
            "CHN-0"
            "CZE-0"
            "DEU-0"
            "EST-0"
            "ara-0"
            "spa-1"
            "spa-0"
            "FIN-0"
            "FRA-0"
            "GRC-0"
            "HRV-0"
            "HUN-0"
            "IDN-0"
            "ISR-0"
            "IND-0"
            "IRN-0"
            "ISL-0"
            "ITA-0"
            "JPN-1"
            "KOR-1"
            "LTU-0"
            "LVA-0"
            "MKD-0"
            "NLD-0"
            "NOR-0"
            "POL-3"
            "POL-0"
            "ROU-1"
            "RUS-0"
            "RUS-1"
            "SWE-1"
            "SVN-0"
            "THA-0"
            "TUR-0"
            "UKR-0"
            "VIE-1"
          ];
        };
      };
      
      profiles.default = {
        presets.betterfox.enable = true;

        settings = {
          # "browser.aboutConfig.showWarning" = false;
          "browser.ctrlTab.sortByRecentlyUsed" = true;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.sessionstore.restore_from_crash" = false;
          "browser.startup.page" = 0;
          "browser.tabs.warnOnClose" = false;
          "browser.tabs.hoverPreview.enabled" = true;
          "browser.topsites.contile.enabled" = false;
          "browser.translations.enable" = false;
          "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
          "middlemouse.paste" = false;
          "zen.pinned-tab-manager.restore-pinned-tabs-to-pinned-url" = true;
          "zen.welcome-screen.seen" = true;

          "gfx.webrender.all" = true;
          "network.http.http3.enabled" = true;
          "network.socket.ip_addr_any.disabled" = true;
          "permissions.default.loopback-network" = 2;
          "permissions.default.local-network" = 2;
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
                  position = 1100;
                };
                "Twitch" = {
                  id = "08792259-a29e-4170-a197-5e1526b1ced4";
                  url = "https://www.twitch.tv";                
                  position = 1200;
                };
                "Anime-Sama" = {
                  id = "65b536f8-13f4-4315-ba51-da4c617a4dab";
                  url = "https://anime-sama.to";
                  position = 1300;
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
                position = 3100;
              };
            };
          };
        };

        pins = {
          "Github" = {
            id = "3ad4b669-86b6-4e16-b336-3ca598b75c90";
            url = "https://github.com";
            position = 10;
            isEssential = true;
            container = 1;
          };

          "Email" = {
            id = "e3ab5f06-391e-4344-bda2-99c4ee9eccf7";
            url = "https://mail.proton.me";
            position = 20;
            isEssential = true;
            container = 1;
          };

          "Drive" = {
            id = "6b954db7-d691-4eaa-993a-77400cedef6a";
            url = "https://drive.proton.me";
            position = 30;
            isEssential = true;
            container = 1;
          };
        };

        search = {
          force = true;
          default = "ddg";
          engines =
            let
              nixSnowflakeIcon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            in {
              "Nix Packages" = {
                urls = [
                  {
                    template = "https://search.nixos.org/packages";
                    params = [
                      {
                        name = "type";
                        value = "packages";
                      }
                      {
                        name = "channel";
                        value = "26.05";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                icon = nixSnowflakeIcon;
                definedAliases = [ "@pkgs" ];
              };             
              "Nix Options" = {
                urls = [
                  {
                    template = "https://search.nixos.org/options";
                    params = [
                      {
                        name = "channel";
                        value = "26.05";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                icon = nixSnowflakeIcon;
                definedAliases = [ "@nop" ];
              };
              "Home Manager Options" = {
                urls = [
                  {
                    template = "https://home-manager-options.extranix.com";
                    params = [
                      {
                        name = "release";
                        value = "release-26.05";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];
                icon = nixSnowflakeIcon;
                definedAliases = [ "@hop" ];
              };
            };
        };

        keyboardShortcutsVersion = 20;
        keyboardShortcuts = [
          {
            id = "zen-workspace-switch-1";
            key = "w";
            modifiers.alt = true;
          }
          {
            id = "zen-workspace-switch-2";
            key = "x";
            modifiers.alt = true;
          }
          {
            id = "zen-workspace-switch-3";
            key = "c";
            modifiers.alt = true;
          }
        ];
      };
    };
  };
}
