
import Data.Maybe
import System.IO

import XMonad
import XMonad.Util.EZConfig
import XMonad.Layout.ThreeColumns

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

-- utils
-- readXRDB :: String -> IO String
-- readXRDB key = fromMaybe "" . findValue key <$> runProcessWithoutInput "xrdb" ["-query"] ""

main :: IO ()
main = xmonad $ xmobarProp $ myConfg

myConfg = def
    { modMask            = mod1Mask
    , layoutHook         = myLayout
    , terminal           = "st"
    , normalBorderColor  = "#75715e"
    , focusedBorderColor = "#a6e22e"
    }

myLayout = tiled ||| threeCol ||| Full
    where
        tiled    = Tall nmaster delta ratio
        threeCol = ThreeColMid nmaster delta ratio
        nmaster  = 1
        delta    = 3/100
        ratio    = 1/2

-- Xmobar

