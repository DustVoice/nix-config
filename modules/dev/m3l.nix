let
  helix-language.homeManager = {
    programs.helix.languages.language = [{
      name = "m3l";
      scope = "source.m3l";
      injection-regex = "m3l";
      file-types = [ "m3l" "swel" ];
      comment-token = "---";
      indent = {
        tab-width = 2;
        unit = "  ";
      };
      grammar = "m3l";
    }];

    home.file.".config/helix/runtime/grammars/m3l.so".source = ./dots/m3l.so;
    home.file.".config/helix/runtime/queries/m3l/highlights.scm".source = ./dots/highlights-m3l.scm;
  };
in
{
  dev.m3l.includes = [
    helix-language
  ];
}
