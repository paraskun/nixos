{ pkgs, ... }:

{
  home-manager.users.paraskun = {
    home.packages = with pkgs; [
        lazygit
    ];

    programs.git = {
      enable = true;

      settings = {
        user = {
          name = "Ivan Paraskun";
          email = "ig.paraskun@gmail.com";

          signing = {
            key = "0x54758D6FE627CB11";
            signByDefault = true;
          };
        };
      };
    };
  };
}
