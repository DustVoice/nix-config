{ den, pkgs, config, ... }:
{
  den.default = {
    includes = [
      den.aspects.hostname
      den.aspects.git
    ];
      
    nix = {
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        trusted-users = [
          "root"
          "@wheel"
        ];
      };
      gc = pkgs.lib.optionalAttrs config.nix.enable {
        automatic = true;
        options = "--delete-older-than 7d";
      };
    };
    
    homeManager = {
      programs = {
        vim.enable = true;
      };
    };
  };
}
