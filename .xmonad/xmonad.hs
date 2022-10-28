import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Ungrab

import XMonad.Layout.Spacing
import XMonad.Layout.Magnifier
import XMonad.Layout.ThreeColumns
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops


main :: IO ()
main = xmonad
     . ewmh
   =<< statusBar "xmobar -x 0 ~/.config/xmobar/xmobarrc" myPP toggleStrutsKey myConfig
  where
    toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
    toggleStrutsKey XConfig{ modMask = m } = (m, xK_b)



myConfig = def
    { modMask    = mod4Mask      -- Rebind Mod to the Super key
    , terminal    = "urxvtc"      -- Default terminal
    , layoutHook = myLayout      -- Use custom layouts
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
    ]

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "mpv" --> doFloat
    , isDialog            --> doFloat
    ]

myLayout = smartBorders $ spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True $ tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

myTitleColor     = "#eeeeee"  -- color of window title
myTitleLength    = 80         -- truncate window title to this length
myCurrentWSColor = "#e6744c"  -- color of active workspace
myVisibleWSColor = "#c185a7"  -- color of inactive workspace
myUrgentWSColor  = "#cc0000"  -- color of workspace with 'urgent' window
myCurrentWSLeft  = "["        -- wrap active workspace with these
myCurrentWSRight = "]"
myVisibleWSLeft  = "("        -- wrap inactive workspace with these
myVisibleWSRight = ")"
myUrgentWSLeft  = "{"         -- wrap urgent workspace with these
myUrgentWSRight = "}"


-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP {
    -- ppCurrent = xmobarColor "#429942" "" . wrap "<" ">"
    ppTitle = xmobarColor myTitleColor "" . shorten myTitleLength
    , ppCurrent = xmobarColor myCurrentWSColor ""
        . wrap myCurrentWSLeft myCurrentWSRight
    , ppVisible = xmobarColor myVisibleWSColor ""
        . wrap myVisibleWSLeft myVisibleWSRight
    , ppUrgent = xmobarColor myUrgentWSColor ""
        . wrap myUrgentWSLeft myUrgentWSRight
}

   

  
