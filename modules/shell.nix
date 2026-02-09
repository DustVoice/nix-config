{ pkgs, ... }:
{
  den.aspects.shell = {
    description = "Shell(s)";
    
    provides = {
      nushell.homeManager.programs.nushell.enable = true;
    };
  };
}
