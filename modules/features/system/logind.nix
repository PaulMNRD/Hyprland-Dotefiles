{
  flake.nixosModules.logind = {
    services.logind.settings.Login = {
      HandlePowerKey = "suspend";
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "suspend";
      HandleLidSwitchDocked = "ignore";
    };
  };
}
