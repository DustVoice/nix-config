{ den, ... }:
{
  den.default.includes = [ den.aspects.vcs._.git ];

  den.aspects.vcs = {
    description = "Version Control System(s)";

    provides = {
      git.includes = [ den.aspects.git ];
    };
  };
}
