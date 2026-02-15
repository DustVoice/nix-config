{
  flake-file.inputs.jjui.url = "github:idursun/jjui";

  dev.vcs.homeManager = { pkgs, ... }: {
    # Dependencies
    programs = {
      difftastic.enable = true;
      difftastic.git.enable = true;
      difftastic.git.diffToolMode = true;

      helix.enable = true;
    };
    home.packages = with pkgs; [
      lazyjj
      jjui
    ];

    # Git
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "DustVoice";
          email  = "info@dustvoice.de";
        };

        core = {
          autocrlf = "input";
          editor = "hx";
        };

        push = {
          default = "simple";
          followTags = true;
        };

        pull.rebase = false;

        http.postBuffer = "500M";

        merge.conflictstyle = "diff3";

        diff.colorMoved = "default";

        init.defaultBranch = "main";
      };

      ignores = [
        ".DS_Store"
        "*.swp"
        ".direnv"
        ".envrc"
        ".envrc.local"
        ".env"
        ".env.local"
        ".jj"
        "devshell.toml"
        ".tool-versions"
      ];

      lfs.enable = true;
    };
        
    # Jujutsu
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
