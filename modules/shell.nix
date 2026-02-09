{ pkgs, ... }:
{
  den.aspects.shell = {
    description = "Shell(s)";
    
    provides = {
      nushell = {
        nixos = { pkgs, ... }: {
          environment.systemPackages = [ pkgs.nushell ];
        };
        
        homeManager = {
          programs.nushell.enable = true;
        };
      };
    };
  };
}
