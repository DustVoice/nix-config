{ inputs, ... }:
{
  # host aspect
  den.aspects.wsl-home = {
    # host NixOS configuration
    nixos =
      { pkgs, ... }:
      {
        imports = [ inputs.nixos-wsl.nixosModules.default ];
        wsl.enable = true;

        environment.systemPackages = [ pkgs.git pkgs.vim ];
      };

    # host provides default home environment for its users
    homeManager =
      { pkgs, ... }:
      {
        programs.direnv.enable = true;

        home.packages = [ ];
      };
  };
}
