{ stdenv }:

stdenv.mkDerivation rec {
  name = "crc-reveng";

  src = ./.;

  makeFlags = [ "EXE=${name}" ];

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/bin"
    cp crc-reveng "$out/bin"
    runHook postInstall
  '';
}
