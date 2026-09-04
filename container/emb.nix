{ pkgs, homeActivation, ... }:

pkgs.dockerTools.buildImage {
  name = "ltp-n";
  tag = "latest";

  fromImage = pkgs.dockerTools.pullImage {
    imageName = "xpon-ng.eltex.loc:5000/builders/olt-ng-builder:latest";

    copyToRoot = [
      homeActivation
    ];

    runAsRoot = ''
      ${homeActivation}/activate
    '';

    config = {
      Cmd = [ "/bin/zsh" ];
      User = "user";
      Env = [
        "HOME=/home/user"
        "PATH=/home/myuser/.local/state/nix/profiles/home-manager/bin:$PATH"
      ];
    };
  };
}

