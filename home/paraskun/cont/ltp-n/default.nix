{ ... }:

{
  imports = [
    ../../programs/nvim
    ../../programs/zsh
  ];

  home = {
    username = "user";
    homeDirectory = "/home/user";

    stateVersion = "26.05";
  };
}
