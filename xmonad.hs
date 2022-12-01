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
    , terminal    = "kitty"      -- Default terminal
    , layoutHook = myLayout  -- Use custom layouts
    , normalBorderColor  = "#cccccc"
    , focusedBorderColor = "#711c91"
    , manageHook = myManageHook  -- Match on certain windows
    }
  `additionalKeysP`
    [ ("M-S-z", spawn "slock")
    , ("M-<Escape>", spawn "rofi -show drun")
    , ("M-]"  , spawn "firefox-esr")
    , ("M-g", gotoMenu)
    , ("M-M1-<Left>",    sendMessage $ ExpandTowards L)
    , ("M-M1-<Right>",   sendMessage $ ShrinkFrom L)
    , ("M-M1-<Up>",      sendMessage $ ExpandTowards U)
    , ("M-M1-<Down>",    sendMessage $ ShrinkFrom U)
    , ("M-M1-C-<Left>",  sendMessage $ ShrinkFrom R)
    , ("M-M1-C-<Right>", sendMessage $ ExpandTowards R)
    , ("M-M1-C-<Up>",    sendMessage $ ShrinkFrom D)
    , ("M-M1-C-<Down>",  sendMessage $ ExpandTowards D)
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

