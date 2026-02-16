{
  __findFile,
  den,
  ...
}: let
  description = ''
    Conditional handling of defined non-standard login shells.
    If supported by <den/user-shell>, this aspect will delegate accordingly.
  '';

  nushell = user: let
    nixos = {pkgs, ...}: {
      programs.bash.enable = true;
      users.users.${user.userName}.shell = pkgs.bash;
    };
    darwin = nixos;
    homeManager.programs.bash = {
      enable = true;
      initExtra = ''
        if [[ $(ps --no-header --pid $PPID --format comm) != "nu" ]]; then
          exec nu
        fi
      '';
    };
    homeManager.programs.nushell = {
      enable = true;
    };
    homeManager.programs.ghostty.settings.command = "nu";
  in {
    inherit nixos darwin homeManager;
  };
in {
  nix-config.user-shell = shell:
    den.lib.parametric {
      inherit description;
      includes =
        if shell == "nushell"
        then [
          ({user, ...}: nushell user)
          ({home, ...}: nushell home)
        ]
        else (<den/user-shell> shell);
    };
}
