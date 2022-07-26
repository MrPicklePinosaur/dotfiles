
import Xmobar

config :: Config
config = defaultConfig {
    font = "xft:Source Code Pro:size=12"
    , additionalFonts = []
    , position = Top
    , bgColor = "#272822"
    -- , borderColor = "#75715e"
    -- , borderWidth = 1
    -- , border = FullB
    , commands = [
        Run $ Memory ["-t", "<fc=#f8f8f2,#f92672> <used>M </fc>"] 10
        , Run $ DiskU [("sda3", "<fc=#272822,#f4bf75> <used> </fc>")] [] 20
        , Run $ BatteryP ["BAT0"] ["-t", "<fc=#272822,#66d9ef> <left>%[<leftbar>] </fc>", "-b", " "] 20
        , Run $ Date "<fc=#272822,#a6e22e> %a %b %d %H:%M </fc>" "date" 10
        , Run $ XMonadLog
    ]
    , template = " %XMonadLog% }{ %memory% %disku% %battery% %date% <fc=#272822,#f8f8f2> [λ] </fc> "
}

main :: IO ()
main = xmobar config

