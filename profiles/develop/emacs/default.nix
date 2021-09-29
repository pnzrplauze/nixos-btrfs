# Emacs is the best...
{ config, lib, pkgs, inputs, ... }: {

  nixpkgs.overlays = [ inputs.emacs-overlay.overlay ];

  environment.systemPackages = with pkgs; [
    ## Emacs itself
    # binutils # native-comp needs 'as', provided by this
    # emacsPgtkGcc   # 28 + pgtk + native-comp
    ((emacsPackagesNgGen emacsPgtkGcc).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))

    ## Doom dependencies
    (ripgrep.override { withPCRE2 = true; })
    gnutls # for TLS connectivity

    ## Optional dependencies
    imagemagick # for image-dired
    #pinentry_emacs) # in-emacs gnupg prompts
    zstd # for undo-fu-session/undo-tree compression

    ## Module dependencies
    # :checkers spell
    (aspellWithDicts (ds: with ds; [
      en
      pl
      en-computers
      en-science
    ]))
    # :checkers grammar
    languagetool
    # :tools editorconfig
    editorconfig-core-c # per-project style config
    # :tools lookup & :lang org +roam
    sqlite
    # :lang cc
    ccls
    # :lang latex & :lang org (latex previews)
    texlive.combined.scheme-medium
    # :lang beancount
    # beancount
    # unstable.fava  # HACK Momentarily broken on nixos-unstable
    # :lang rust
    #rustfmt
    #unstable.rust-analyzer
  ];

  #env.PATH = [ "$XDG_CONFIG_HOME/emacs/bin" ];

  #modules.shell.zsh.rcFiles = [ "${configDir}/emacs/aliases.zsh" ];

  fonts.fonts = [ pkgs.emacs-all-the-icons-fonts ];

  services.emacs = {
    enable = true;
  };
}
