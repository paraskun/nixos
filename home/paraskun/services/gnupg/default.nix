{ pkgs, os, ... }:

let
  key = pkgs.fetchurl {
    url = "https://github.com/paraskun.gpg";
    sha256 = "1127jwwidvvwv9md4jpxkk0abva4cpvjpzc7zybg1f8a0jvn5mrj";
  };
in
{
  imports = [
    ./${os}.nix
  ];

  environment.etc."u2f_keys".text = ''
  paraskun:GCTH0vCxAj9WjJdJ9ofw4HMgCPHgZ5DSvL5s+Er6Beee687V0YK6m5AknzreXetgOacKlDjxY7YrC2wlYeatRg==,bnRopy2vo1LpbGLb3buANfOVymDjd5YkTzo12Jic2w7m5xFZ34zRVVCGuJ2TC1SdUasel64zS9f73IzI7jwaVQ==,es256,+presence   
  '';

  home-manager.users.paraskun = {
    services.ssh-agent.enable = false;

    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
      defaultCacheTtl = 60;
      maxCacheTtl = 300;
    };

    programs.gpg = {
      enable = true;
      mutableTrust = false;

      publicKeys = [
        {
          source = "${key}";
          trust = "ultimate";
        }
      ];

      settings = {
        personal-cipher-preferences = "AES256 AES192 AES";
        personal-digest-preferences = "SHA512 SHA384 SHA256";
        personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
        cert-digest-algo = "SHA512";
        s2k-digest-algo = "SHA512";
        s2k-cipher-algo = "AES256";
        charset = "utf-8";
        no-comments = true;
        no-emit-version = true;
        no-greeting = true;
        with-fingerprint = true;
        require-cross-certification = true;
        require-secmem = true;
        no-symkey-cache = true;
        armor = true;
        use-agent = true;
        keyserver = "hkps://keys.openpgp.org";
      };
    };
  };
}
