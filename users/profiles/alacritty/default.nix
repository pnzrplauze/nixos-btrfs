{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      window.decorations = "full";
      font.size = 8.0;
      cursor.style = "Beam";

      # snazzy theme
      colors = {
        # Default colors
        primary = {
          background = "#282c34";
          foreground = "#bbc2cf";
        };
        # Normal colors
        normal = {
          black = "#1c1f24";
          red = "#ff6c6b";
          green = "#98be65";
          yellow = "#da8548";
          blue = "#51afef";
          magenta = "#c678dd";
          cyan = "#5699af";
          white = "#202328";
        };
        # Bright colors
        bright = {
          black = "#5b6268";
          red = "#da8548";
          green = "#4db5bd";
          yellow = "#ecbe7b";
          blue = "#3071db";
          magenta = "#a9a1e1";
          cyan = "#46d9ff";
          white = "#dfdfdf";
        };
      };
    };
  };
}
