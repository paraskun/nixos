{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "brave";
      TERMINAL = "ghostty";
    };
  };
}
