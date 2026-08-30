{ pkgs, ... }:

{
  home-manager.users.paraskun = {
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
        ripgrep
        tree-sitter
      ];
    };

    xdg.configFile."nvim" = {
      source = ../../dotfiles/nvim;
    };
  };
}
