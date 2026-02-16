let
  ssh-config.homeManager.programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        forwardAgent = false;
        addKeysToAgent = "no";
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";

        setEnv."TERM" = "xterm";
      };
    };
  };

  dustdev.homeManager = {config, ...}: {
    programs.ssh.matchBlocks = {
      "dustdev" = {
        hostname = "dev.dustvoice.de";
        user = "dustvoice";
        forwardAgent = true;
        setEnv."TERM" = "xterm";
        extraOptions."PasswordAuthentication" = "no";
        identityFile = "${config.home.homeDirectory}/.ssh/id_ed25519_sk_dustdev";
      };
      "dustdev-root" = {
        hostname = "dev.dustvoice.de";
        user = "root";
        forwardAgent = true;
        setEnv."TERM" = "xterm";
        extraOptions."PasswordAuthentication" = "no";
        identityFile = "${config.home.homeDirectory}/.ssh/id_ed25519_sk_dustdev_root";
      };
    };
  };
in {
  dev.ssh = {
    includes = [
      ssh-config
      dustdev
    ];
  };
}
