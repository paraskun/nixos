{ stdenv, lib, zlib, cmake, ninja, ... }:

stdenv.mkDerivation {
  pname = "rftp";
  version = "latest";

  src = builtins.fetchGit {
    url = "https://gitlab.eltex.loc/xpon/rftp.git";
    rev = "831504b53a815184cea563a46169947edda80228";
  };

  buildInputs = [ zlib ];
  nativeBuildInputs = [ cmake ninja ];

  meta = with lib; {
    description = "Rapid FTP";
    platforms = platforms.linux;
  };
}
