{ lib, ... }: {
  dev.carapace.homeManager = { config, ... }: {
    programs.carapace = {
      enable = true;

      enableNushellIntegration = lib.mkIf config.programs.nushell.enable true;
    };
  };
}
