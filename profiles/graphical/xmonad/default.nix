{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    farbfeld
    xss-lock
    imgurbash2
    maim
    xclip
    xorg.xdpyinfo
    # dunst
    haskellPackages.xmobar
  ];

  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = import ./xmonad.hs.nix { inherit pkgs; };
  };

  services.picom = {
    enable = true;
    inactiveOpacity = 0.95;
    settings = {
      "unredir-if-possible" = true;
      "focus-exclude" = "name = 'slock'";
    };
  };

  # services.espanso.enable = true;

  programs.slock.enable = true;

  # services.dunst = {
  #   enable = true;
  #   # iconTheme = {
  #   #   package = pkgs.paper-icon-theme;
  #   #   name = "Paper";
  #   #   size = "48x48";
  #   # };
  #   settings = rec {
  #     global = {
  #       font = "Iosevka Term 10";
  #       markup = "yes";
  #       plain_text = "no";
  #       format = "<b>%s</b>\n%b";
  #       sort = "yes";
  #       indicate_hidden = "yes";
  #       alignment = "center";
  #       bounce_freq = 0;
  #       show_age_threshold = 30;
  #       word_wrap = "yes";
  #       ignore_newline = "no";
  #       stack_duplicates = "yes";
  #       hide_duplicates_count = "yes";
  #       geometry = "700x5-0-70";
  #       shrink = "no";
  #       transparency = 15;
  #       idle_threshold = 0;
  #       follow = "keyboard";
  #       sticky_history = "yes";
  #       history_length = 15;
  #       show_indicators = "no";
  #       startup_notification = false;
  #       dmenu = "/run/current-system/sw/bin/dmenu -p dunst:";
  #       browser = "/etc/profiles/per-user/e.bailey/bin/firefox -new-tab";
  #       icon_position = "left";
  #       max_icon_size = 80;
  #       frame_width = 0;
  #       frame_color = "#8EC07C";
  #     };
  #     shortcuts = {
  #       close = "mod1+space";
  #       close_all = "mod4+mod1+space";
  #       history = "ctrl+grave";
  #     };
  #     urgency_low = {
  #       frame_color = "#3B7C87";
  #       foreground = "#3B7C87";
  #       background = "#2B313C";
  #       timeout = 4;
  #     };
  #     urgency_normal = {
  #       frame_color = "#5B8234";
  #       foreground = "#5B8234";
  #       background = "#2B313C";
  #       timeout = 6;
  #     };
  #     urgency_critical = {
  #       frame_color = "#B7472A";
  #       foreground = "#B7472A";
  #       background = "#191311";
  #       timeout = 8;
  #     };
  #     # slack = {
  #     #   appname = "Slack";
  #     #   body = "*critical*";
  #     #   frame_color = "#B7472A";
  #     #   foreground = "#B7472A";
  #     #   background = "#191311";
  #     #   urgency = "critical";
  #     # };
  #   };
  # };
}
