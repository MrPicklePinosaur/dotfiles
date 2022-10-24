
import Data.Maybe
import System.IO

import XMonad
import XMonad.Util.EZConfig
import XMonad.Layout.ThreeColumns

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

-- need to install xmobar package with `with_xft` feature
-- $ cabal install -fwith_xft --lib --reinstall xmobar
-- then build xmobar with
-- $ ghc --make xmobar.hs
-- and ensure the built binary is in path

-- import XMonad.Layout.LayoutCombinators

-- utils
-- readXRDB :: String -> IO String
-- readXRDB key = fromMaybe "" . findValue key <$> runProcessWithoutInput "xrdb" ["-query"] ""

main :: IO ()
main = do
    xmproc <- spawnPipe ".config/xmonad/xmobar .config/xmonad/xmobar.hs"
    xmonad $ xmobarProp $ def {
        modMask              = mod1Mask
        , layoutHook         = myLayout
        , terminal           = "st"
        , normalBorderColor  = "#75715e"
        , focusedBorderColor = "#a6e22e"
        , logHook = dynamicLogWithPP $ def { ppOutput = hPutStrLn xmproc }
    }


-- myConfg =     -- `additionalKeysP`
    -- [ ("M-f", sendMessage $ JumpToLayout "Full")
    -- ]

myLayout = tiled ||| threeCol ||| Full
    where
        tiled    = Tall nmaster delta ratio
        threeCol = ThreeColMid nmaster delta ratio
        nmaster  = 1
        delta    = 3/100
        ratio    = 1/2

-- Xmobar

