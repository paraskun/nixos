{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
  };

  xdg.confgFile."nvim" = {
    source = ../dotfiles/nvim;
  };
}
