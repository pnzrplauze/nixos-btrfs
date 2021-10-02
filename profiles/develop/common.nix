{ pkgs, ... }: {
  imports = [ ./zsh ./emacs ];

  # home-manager.users.jack = {
  #   imports = [ ./emacs ];
  # };

  environment.shellAliases = {
    v = "$EDITOR";
    pass = "gopass";
  };

  environment.sessionVariables = {
    PAGER = "less";
    LESS = "-iFJMRWX -z-4 -x4";
    LESSOPEN = "|${pkgs.lesspipe}/bin/lesspipe.sh %s";
    EDITOR = "k";
    VISUAL = "k";
  };

  environment.systemPackages = with pkgs; [
    clang
    file
    gnupg
    less
    ncdu
    gopass
    tig
    wget
    neovim
  ];

  fonts =
    let
      nerdfonts = pkgs.nerdfonts.override {
        fonts = [ "DejaVuSansMono" "JetBrainsMono" "Overpass" "IBMPlexMono" ];
      };
    in
    {
      fonts = [ nerdfonts ];
      fontconfig.defaultFonts = {
        monospace = [ "JetBrains Mono Regular Nerd Font Complete Mono" ];
        sansSerif = [ "DejaVu Sans Mono Nerd Font Complete Mono" ];
      };
    };

  services.emacs.package = pkgs.emacsPgtkGcc;

  # documentation = {
  #   dev.enable = true;
  #   man.generateCaches = true;
  # };
}
