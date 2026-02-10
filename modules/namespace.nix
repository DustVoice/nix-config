{ inputs, den, ... }:
{
  _module.args.__findFile = den.lib.__findFile;

  imports = [
    (inputs.den.namespace "nix-config" true)
    (inputs.den.namespace "my" false)
    (inputs.den.namespace "dev" false)
  ];
}
