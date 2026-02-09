{ den, pkgs, ... }:
{
  den.default.includes = [ den.aspects.editor._.neovim ];
  
  den.aspects.editor = {
    description = "Editor(s)";
    
    provides = {
      neovim.homeManager.programs.neovim.enable = true;
    };
  };
}
