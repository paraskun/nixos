{ ... }:

{
  imports = [
    ../../programs/nvim
    ../../programs/zsh
  ];

  home = {
    username = "vscode";
    homeDirectory = "/home/vscode";

    stateVersion = "26.05";
  };
}
