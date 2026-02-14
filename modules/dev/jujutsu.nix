{
  flake-file.inputs.jjui.url = "github:idursun/jjui";

  dev.jujutsu.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      lazyjj
      jjui
    ];

    programs.helix.enable = true;
    programs.difftastic.enable = true;

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
        };
      };
    };
  };
}
