{ pkgs, ... }:

{
  time.timeZone = "Asia/Novosibirsk";

  programs.gnupg.agent = {
    enable = true;
  };
  programs.zsh = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    inetutils
    dnsutils
    vim
    curl
    git
    pass
    btop
  ];
}
