{ lib, sources, stdenv, ... }:
stdenv.mkDerivation {
  inherit (sources.sddm-chili) src pname version;

  installPhase = ''
    mkdir -p $out/share/sddm/themes/chili

    cp -r * $out/share/sddm/themes/chili
  '';

  meta = with lib; {
    inherit version;
    description = "The hottest theme around for SDDM";
    homepage = "https://github.com/MarianArlt/sddm-chili";
    maintainers = [ maintainers.mschneider ];
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}
