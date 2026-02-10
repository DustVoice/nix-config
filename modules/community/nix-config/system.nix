{
  nix-config.system.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.git pkgs.vim ];
    };
}
