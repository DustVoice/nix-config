{ inputs, ... }:
let
  flake-file.inputs = {
    jjdag = {
      url = "github:anthrofract/jjdag";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    jjui = {
      url = "github:idursun/jjui";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "nixpkgs";
    };
  };

  git.homeManager = {
    # Dependencies
    programs = {
      difftastic.enable = true;
      difftastic.git.enable = true;
      difftastic.git.diffToolMode = true;
      helix.enable = true;
    };

    # Main Program
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

  jujutsu.homeManager = { pkgs, ... }: {
    # Dependencies
    programs = {
      difftastic.enable = true;
      helix.enable = true;
    };
    nixpkgs.overlays = [ inputs.jjdag.overlays.default ];
    home.packages = with pkgs; [
      lazyjj
      jjui
      jjdag
    ];

    # Main Program
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
in
{
  inherit flake-file;
  
  dev.vcs.includes = [
    git
    jujutsu
  ];
}
