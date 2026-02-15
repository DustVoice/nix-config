let
  yubikey.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      yubikey-manager
      yubioath-flutter
    ];

    services.udev.packages = with pkgs; [
      yubikey-personalization
    ];
  };

  pcsc-lite = {
    nixos.services.pcscd.enable = true;
    homeManager.programs.gpg.scdaemonSettings.disable-ccid = true;
  };

  gpg.homeManager = {
    programs.gpg = {
      enable = true;
      publicKeys = [{
        source = ./keys/dustvoice-public-key.asc;
        trust = 5;
      }];
    };

    services.gpg-agent = {
      enable = true;
      sshKeys = [ "26AACF211BE8A6FB4383ACF626B1D4394551CB84" ];

      defaultCacheTtl = 300;
      defaultCacheTtlSsh = 300;
      maxCacheTtl = 1200;
      maxCacheTtlSsh = 1200;

      extraConfig = ''
        allow-loopback-pinentry
        allow-emacs-pinentry
      '';
    };
  };
in
{
  dev.smartcard.includes = [
    yubikey
    pcsc-lite
    gpg
  ];
}
