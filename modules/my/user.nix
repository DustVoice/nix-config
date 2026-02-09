{ __findFile, ... }:
{
  my.user = <den.lib.parametric> {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")

      <dustvoice/cli-tui>
      <dustvoice/direnv>
      <dustvoice/editors>
      <dustvoice/fish>
      <dustvoice/git>
      <dustvoice/ghostty>
      <dustvoice/helix>
      <dustvoice/jujutsu>
      <dustvoice/nushell>
      # <dustvoice/secrets>
      <dustvoice/terminals>
    ];
  };
}
