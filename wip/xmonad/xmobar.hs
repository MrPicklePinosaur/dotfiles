
import Xmobar

config :: Config
config = defaultConfig {
    font = "xft:Source Code Pro:size=12"
    , additionalFonts = []
    , position = Top
    , commands = [
        Run $ Memory ["-t", "<used>M"] 10
        , Run $ DiskU [("sda3", "<used>")] [] 20
        , Run $ BatteryP ["BAT0"] ["-t", "<left>%"] 20
        , Run $ Date "%a %b %_d %H:%M" "date" 10
    ]
    , template = "}{ %memory% | %disku% | %batteryp% | %date%"
}

main :: IO ()
main = xmobar config

