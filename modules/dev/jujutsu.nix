{
  flake-file.inputs.jjui.url = "github:idursun/jjui";

  dev.jujutsu.homeManager =
    { pkgs, ... }:
    {
    home.packages = [
      pkgs.lazyjj
      pkgs.jjui
    ];

    programs = {
      helix.enable = true;
      difftastic.enable = true;
    };

    programs.jujutsu = {
      enable = true;

      settings = {
        user = {
          name = "DustVoice";
          email = "info@dustvoice.de";
        };

        ui = {
          editor = "hx";

          default-command = "log";
          
          diff-editor = ":builtin";
          diff-formatter = ["difft" "--color=always" "$left" "$right"];

          show-cryptographic-signatures = true;
        };
      };
    };
  };
}
