{ pkgs, ... }:

{
  imports = [
    ../programs/nvim.nix
    ../programs/zsh.nix
    ../programs/git.nix
  ];


  home = {
    username = "user";
    homeDirectory = "/home/user";

    packages = with pkgs; [
      ripgrep
    ];

    stateVersion = "26.05";
  };
}
