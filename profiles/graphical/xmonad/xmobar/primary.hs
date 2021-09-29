-- http://projects.haskell.org/xmobar/

Config {
    font = "xft:JetBrainsMono Nerd Font Mono:weight=bold:pixelsize=16:antialias=true:hinting=true",
    bgColor = "#292d3e",
    fgColor = "#f07178",
    lowerOnStart = True,
    hideOnStart = False,
    allDesktops = True,
    persistent = True,
    commands = [
        Run Date "  %d %b %Y %H:%M " "date" 600,
        Run Com "/home/jack/.config/xmobar/volume" [] "volume" 10,
        Run Com "/home/jack/.config/xmobar/battery" [] "battery" 10,
        Run Com "/home/jack/.config/xmobar/brightness" [] "brightness" 10,
        -- Run Com "bash" ["-c", "checkupdates | wc -l"] "updates" 3000,
        Run Com "/home/jack/.config/xmobar/music" [] "music" 10,
        -- Run MPD ["-t", "<state>: <artist> - <track>"] 10,
        Run Memory ["-t","Mem: <usedratio>%"] 10,
        Run Com "/home/jack/.config/xmobar/trayer-padding-icon.sh" [] "trayerpad" 600,
        Run UnsafeStdinReader
    ],
    alignSep = "}{",
    template = "<fc=#b303ff>   </fc>%UnsafeStdinReader% }{ \
      \<fc=#DDA0DD>%music% |</fc>\
      \<fc=#FFA500> %memory% |</fc>\
      \<fc=#FFB86C> %brightness%|</fc>\
      \<fc=#c3e88d> %battery%|</fc>\
      \<fc=#82AAFF> %volume% |</fc>\
      \<fc=#8BE9FD> %date%| </fc>\
      \%trayerpad%"
}
-- \<fc=#B22222>  %updates% |</fc>\
