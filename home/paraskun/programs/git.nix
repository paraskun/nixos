{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Ivan Paraskun";
        email = "ig.paraskun@gmail.com";
      };
    };

    ignores = [
      ".keys"
    ];
  };
}
