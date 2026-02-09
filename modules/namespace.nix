{ inputs, den, ... }:
{
  _module.args.__findFile = den.lib.__findFile;

  flake-file.inputs.dendrix = {
    url = "github:vic/dendrix";

    inputs = {
      den.follows = "den";
      import-tree.follows = "import-tree";
      nixpkgs-lib.follows = "nixpkgs-lib";
    };
  };

  imports = [
    (inputs.den.namespace "dustvoice" false)
    (inputs.den.namespace "my" false)
    (inputs.den.namespace "vix" [ true inputs.dendrix ])
  ];
}
