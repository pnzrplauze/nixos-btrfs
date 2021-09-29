{ pkgs, ... }:
let
  inherit (builtins) readFile;
  #inherit (pkgs) writeScript;

  #autostart = writeScript "xmonad-autostart" (readFile ./scripts/autostart);
in
''
  ${readFile ./_xmonad.hs}
''
