{ pkgs, ... }:

{
  imports = [
    ../programs/nvim.nix
    ../programs/zsh.nix
  ];

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Параскун Иван Григорьевич";
        email = "ivan.paraskun@eltex.loc";
      };
    };

    ignores = [
      ".keys"
    ];
  };


  home = {
    username = "user";
    homeDirectory = "/home/user";

    packages = with pkgs; [
      ripgrep
      lazygit
    ];

    stateVersion = "26.05";
  };
}
