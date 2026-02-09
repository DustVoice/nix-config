{ den, ... }:
{
  den.default = {
    includes = [
      den.aspects.hostname
      den.aspects.git
    ];
      
    homeManager = {
      programs = {
        vim.enable = true;
      };
    };
  };
}
