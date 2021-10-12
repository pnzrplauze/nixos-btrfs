-- http://projects.haskell.org/xmobar/

Config { font            = "xft:JetBrainsMono Nerd Font Mono:weight=bold:pixelsize=16:antialias=true:hinting=true"
      , additionalFonts = [ "xft:Mononoki:pixelsize=11:antialias=true:hinting=true"
                          , "xft:Font Awesome 5 Free Solid:pixelsize=12"
                          , "xft:Font Awesome 5 Brands:pixelsize=12"
                          ]
      , bgColor      = "#282c34"
      , fgColor      = "#ff6c6b"
      -- Position TopSize and BottomSize take 3 arguments:
      --   an alignment parameter (L/R/C) for Left, Right or Center.
      --   an integer for the percentage width, so 100 would be 100%.
      --   an integer for the minimum pixel height for xmobar, so 24 would force a height of at least 24 pixels.
      --   NOTE: The height should be the same as the trayer (system tray) height.
      , position       = TopSize L 100 24
      , lowerOnStart = True
      , hideOnStart  = False
      , allDesktops  = True
      , persistent   = True
      , iconRoot     = "./xpm/"  -- default: "."
      , commands = [
                      -- Echos a "penguin" icon in front of the kernel output.
                    Run Com "echo" ["<fn=3>\xf17c</fn>"] "penguin" 3600
                  , Run Com "/home/jack/.config/xmobar/volume" [] "volume" 10
                  , Run Com "/home/jack/.config/xmobar/battery" [] "battery" 10,
                  , Run Com "/home/jack/.config/xmobar/brightness" [] "brightness" 10,
                      -- Get kernel version (script found in .local/bin)
                  , Run Com "/home/jack/.config/xmobar/kernel" [] "kernel" 36000
                      -- Cpu usage in percent
                  , Run Cpu ["-t", "<fn=2>\xf108</fn>  cpu: (<total>%)","-H","50","--high","red"] 20
                      -- Ram used number and percent
                  , Run Memory ["-t", "<fn=2>\xf233</fn>  mem: <used>M (<usedratio>%)"] 20
                      -- Disk space free
                  , Run DiskU [("/", "<fn=2>\xf0c7</fn>  hdd: <free> free")] [] 60
                      -- Echos an "up arrow" icon in front of the uptime output.
                  , Run Com "echo" ["<fn=2>\xf0aa</fn>"] "uparrow" 3600
                      -- Uptime
                  , Run Uptime ["-t", "uptime: <days>d <hours>h"] 360
                      -- Time and date
                  , Run Date "<fn=2>\xf017</fn>  %d %b %Y - (%H:%M) " "date" 50
                      -- Script that dynamically adjusts xmobar padding depending on number of trayer icons.
                  , Run Com "/home/jack/.config/xmobar/trayer-padding-icon.sh" [] "trayerpad" 20
                      -- Prints out the left side items such as workspaces, layout, etc.
                  , Run UnsafeStdinReader
                  ]
      , sepChar = "%"
      , alignSep = "}{"
      , template = " <icon=haskell_20.xpm/>   <fc=#666666>|</fc> %UnsafeStdinReader% }{ <box type=Bottom width=2 mb=2 color=#51afef><fc=#51afef>%penguin%  <action=`alacritty -e htop`>%kernel%</action> </fc></box>    <box type=Bottom width=2 mb=2 color=#ecbe7b><fc=#ecbe7b><action=`alacritty -e htop`>%cpu%</action></fc></box>    <box type=Bottom width=2 mb=2 color=#ff6c6b><fc=#ff6c6b><action=`alacritty -e htop`>%memory%</action></fc></box>    <box type=Bottom width=2 mb=2 color=#a9a1e1><fc=#a9a1e1><action=`alacritty -e htop`>%disku%</action></fc></box>    <box type=Bottom width=2 mb=2 color=#98be65><fc=#98be65>%uparrow%  <action=`alacritty -e htop`>%uptime%</action></fc></box>     <fc=#FFB86C> %brightness%|</fc>    <fc=#c3e88d> %battery%|</fc>    <fc=#82AAFF> %volume% |</fc>   <box type=Bottom width=2 mb=2 color=#46d9ff><fc=#46d9ff><action=`emacsclient -c -a 'emacs' --eval '(doom/window-maximize-buffer(dt/year-calendar))'`>%date%</action></fc></box> %trayerpad%"
      }
