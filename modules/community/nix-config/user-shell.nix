{
  __findFile,
  den,
  ...
}: let
  description = ''
    Conditional handling of defined non-standard login shells.
    If supported by <den/user-shell>, this aspect will delegate accordingly.
  '';

  nushell = let
    user = {pkgs, ...}: {
      programs.bash.enable = true;
      shell = pkgs.bash;
    };
    homeManager.programs.bash = {
      enable = true;
      initExtra = ''
        if [[ $TERM != "dumb" && $(ps --no-header --pid $PPID --format comm) != "nu" ]]; then
          exec nu
        fi
      '';
    };
    homeManager.programs.nushell = {
      enable = true;
    };
    homeManager.programs.ghostty.settings.command = "nu";
  in {
    inherit user homeManager;
  };
in {
  nix-config.user-shell = shell:
    den.lib.parametric {
      inherit description;
      includes =
        if shell == "nushell"
        then [
          ({user, ...}: nushell)
          ({home, ...}: nushell)
        ]
        else (<den/user-shell> shell);
    };
}
