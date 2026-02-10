{
  dev.git.homeManager =
    { config, ... }:
    {
      programs = {
        difftastic = {
          enable = true;
          git = {
            enable = true;
            diffToolMode = true;
          };
        };
  
        helix.enable = true;
      };
  
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
    };
}
