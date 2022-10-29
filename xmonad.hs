import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.CenteredMaster
import XMonad.Layout.Grid
import XMonad.Hooks.ManageHelpers
import XMonad.Actions.WindowBringer
import XMonad.Layout.Hidden


main :: IO ()
main = xmonad $ ewmh def
    { modMask    = mod4Mask  -- Rebind Mod to the Super key
    , terminal    = "urxvtc"      -- Default terminal
    , layoutHook = myLayout  -- Use custom layouts
    , manageHook = myManageHook  -- Match on certain windows
    }
  `additionalKeysP`
    [ ("M-S-z", spawn "slock")
    , ("M-S-p", spawn "/home/user/.local/bin/dmenu_run_history")
    , ("M-<Escape>", spawn "language.sh")
    , ("M-S-v", spawn "poweroffreboot")
    , ("M-S-h", spawn "chwall-dmenu")
    , ("M-S-=", unGrab *> spawn "flameshot")
    , ("M-]"  , spawn "firefox-esr")
    , ("M-g", gotoMenu)
    , ("M-b", bringMenu)
    , ("M-<F1>", withFocused hideWindow)
    , ("M-<F2>", popOldestHiddenWindow)
    ]

myLayout = smartBorders $ hiddenWindows emptyBSP ||| centerMaster Grid ||| Full

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "mpv" --> doFloat
    , isDialog            --> doFloat
    ]
