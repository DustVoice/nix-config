let
  yubikey.nixos = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      yubikey-manager
      yubioath-flutter
    ];

    services.udev.packages = with pkgs; [
      yubikey-personalization
    ];
  };

  yubikey-switch = {
    homeManager = {
      pkgs,
      config,
      ...
    }: let
      script = pkgs.writeShellApplication {
        name = "yubikey-switch";
        runtimeInputs = [
          pkgs.coreutils
          pkgs.bash
          pkgs.killall
          pkgs.gnupg
        ];
        bashOptions = [
          "nounset"
          "pipefail"
        ];
        text = ''
          killall gpg-agent

          rm "${config.home.homeDirectory}/.gnupg/private-keys-v1.d/26AACF211BE8A6FB4383ACF626B1D4394551CB84.key"
          rm "${config.home.homeDirectory}/.gnupg/private-keys-v1.d/6DE8255F05181D389896EBE19B59C3D8FB9E8730.key"
          rm "${config.home.homeDirectory}/.gnupg/private-keys-v1.d/808C4504182AA76DE8A7CB216722EBF6966D9C99.key"

          gpg --card-status
        '';
      };
    in {
      home.packages = with pkgs; [
        killall
        script
      ];

      systemd.user.services.yubikey-switch = {
        Unit.Description = "Switch to new Yubikey upon insertion";
        Install.WantedBy = ["dev-yubikey.device"];
        Service = {
          Type = "oneshot";
          ExecStart = "${script}/bin/yubikey-switch";
        };
      };
    };

    nixos = {pkgs, ...}: {
      services.udev.extraRules = ''
        ENV{ID_VENDOR}=="Yubico", ENV{ID_VENDOR_ID}=="1050", ENV{ID_MODEL_ID}=="0010|0111|0112|0113|0114|0115|0116|0401|0402|0403|0404|0405|0406|0407|0410", SYMLINK+="yubikey", TAG+="systemd"
      '';
    };
  };

  pcsc-lite = {
    nixos.services.pcscd.enable = true;
    homeManager.programs.gpg.scdaemonSettings.disable-ccid = true;
  };

  gnupg-with-ssh.homeManager = {
    # gpg
    programs.gpg = {
      enable = true;
      publicKeys = [
        {
          source = ./keys/dustvoice-public-key.asc;
          trust = 5;
        }
      ];
    };

    # gpg-agent
    services.gpg-agent = {
      enable = true;

      defaultCacheTtl = 300;
      defaultCacheTtlSsh = 300;
      maxCacheTtl = 1200;
      maxCacheTtlSsh = 1200;

      extraConfig = ''
        allow-loopback-pinentry
        allow-emacs-pinentry
      '';

      sshKeys = ["26AACF211BE8A6FB4383ACF626B1D4394551CB84"];
      enableSshSupport = true;
      enableExtraSocket = true;
    };
  };

  pinentry.homeManager = {pkgs, ...}: {
    home.packages = with pkgs; [pinentry-qt];
    services.gpg-agent.pinentry.package = pkgs.pinentry-qt;
  };
in {
  dev.smartcard = {
    includes = [
      yubikey
      yubikey-switch
      pcsc-lite
      gnupg-with-ssh
      pinentry
    ];
  };
}
