{ __findFile, ... }:
{
  my.user = <den.lib.parametric> {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")

      <dust/cli-tui>
      <dust/direnv>
      <dust/editors>
      <dust/fish>
      <dust/git>
      <dust/ghostty>
      <dust/helix>
      <dust/jujutsu>
      <dust/nushell>
      # <dust/secrets>
      <dust/terminals>
    ];
  };
}
