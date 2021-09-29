{ pkgs, ... }: {
  imports = [ ./zsh ./emacs ];

  # home-manager.users.jack = {
  #   imports = [ ./emacs ];
  # };

  environment.shellAliases = {
    v = "$EDITOR";
    pass = "gopass";
    vim = "nvim";
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
    git-crypt
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
        fonts = [ "DejaVuSansMono" "JetBrainsMono" ];
      };
    in
    {
      fonts = [ nerdfonts ];
      fontconfig.defaultFonts.monospace =
        [ "DejaVu Sans Mono Nerd Font Complete Mono" ];
    };

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
  };
}
