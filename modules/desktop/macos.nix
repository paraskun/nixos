{ ... }:

{
  imports = [
    ./base.nix
  ];

  homebrew = {
    enable = true;

    taps = [];
    brews = [];

    casks = [
      "ghostty"
    ];
  };
}
