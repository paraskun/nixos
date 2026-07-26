{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      nil
      clang-tools
      rust-analyzer
      gopls
    ];
  };

  xdg.configFile."nvim" = {
    source = ../dotfiles/nvim;
  };
}
