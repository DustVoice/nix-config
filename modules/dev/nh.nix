let
  nh.homeManager = {config, ...}: {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";

      # IMPORTANT: Assumes that you cloned `DustVoice/nix-config` into the home directory.
      flake = "${config.home.homeDirectory}/nix-config";
    };

    home.shellAliases = {
      nhc = "sudo nh clean all";
      nhh = "nh home switch";
      nho = "nh os switch";
    };
  };
in {
  dev.nh.includes = [
    nh
  ];
}
