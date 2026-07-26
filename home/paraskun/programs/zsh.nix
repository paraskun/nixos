{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "brave";
      TERMINAL = "ghostty";
    };
  };
}
