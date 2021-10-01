{ pkgs, ... }:
let inherit (builtins) readFile;
in
{
  imports = [ ../develop/common.nix ./xmonad ../network/common.nix ./im ];

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;

  security.rtkit.enable = true;
  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
  };

  services.mpd = {
    enable = true;
    user = "jack";
    group = "users";
    musicDirectory = "/home/jack/music";
    dataDir = "/home/anders/.mpd";
    extraConfig = ''
      audio_output {
        type "pulse"
        name "Pulseaudio"
        server "127.0.0.1"
      }
    '';
  };

  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  # };

  boot = {
    # kernelPackages = pkgs.linuxPackages_zen;
    kernelPackages = pkgs.linuxPackages_latest;
    tmpOnTmpfs = true;
    kernel.sysctl."kernel.sysrq" = 1;
  };

  environment = {

    etc = {
      "xdg/gtk-3.0/settings.ini" = {
        text = ''
          [Settings]
          gtk-icon-theme-name=Papirus
          gtk-theme-name=Adapta
          gtk-cursor-theme-name=Adwaita
        '';
        mode = "444";
      };
    };

    sessionVariables = {
      # Theme settings
      QT_QPA_PLATFORMTHEME = "gtk2";

      GTK2_RC_FILES =
        let
          gtk = ''
            gtk-icon-theme-name="Papirus"
            gtk-cursor-theme-name="Adwaita"
          '';
        in
        [
          ("${pkgs.writeText "iconrc" "${gtk}"}")
          "${pkgs.adapta-gtk-theme}/share/themes/Adapta/gtk-2.0/gtkrc"
          "${pkgs.gnome3.gnome-themes-extra}/share/themes/Adwaita/gtk-2.0/gtkrc"
        ];
    };

    systemPackages = with pkgs; [
      adapta-gtk-theme
      cursor
      feh
      ffmpeg-full
      gnome3.adwaita-icon-theme
      gnome3.networkmanagerapplet
      gnome-themes-extra
      imlib2
      librsvg
      libsForQt5.qtstyleplugins
      papirus-icon-theme
      pamixer
      qt5.qtgraphicaleffects
      sddm-chili
      xsel
      zathura
      dmenu
      networkmanager_dmenu
      alacritty
      firefox
      pcmanfm
    ];
  };

  services.xbanish.enable = true;

  services.gnome.gnome-keyring.enable = true;

  services.xserver = {
    enable = true;

    libinput.enable = true;

    displayManager.sddm = {
      enable = true;
      theme = "chili";
    };
  };
}
