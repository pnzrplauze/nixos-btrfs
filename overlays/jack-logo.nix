final: prev: {
  nrd-logo = prev.stdenv.mkDerivation {
    name = "jack-logo";
    src = ../users/jack/logo.png;
    dontUnpack = true;
    installPhase = ''
      mkdir -p $out/share/sddm/faces
      cp $src $out/share/sddm/faces/jack.face.icon
    '';
  };
}
