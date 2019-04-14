import XMonad
import XMonad.Config.Desktop
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Grid
import XMonad.Layout.ResizableTile
import XMonad.Layout.NoBorders
import qualified XMonad.StackSet as W
import System.IO


myLayoutHook = avoidStruts (tiled ||| Grid ||| Full)
  where
    tiled = smartBorders (ResizableTall 1 (2/100) (1/2) [])

myManageHook = composeAll
  [
    isFullscreen --> (doF W.focusDown <+> doFullFloat)
  ]

defaults  = defaultConfig {
   terminal = "urxvt",
   focusFollowsMouse = False,
   modMask = mod4Mask,
   manageHook = myManageHook,
   layoutHook = myLayoutHook
}

main = do
  xmproc <- spawnPipe "xmobar ~/.xmonad/xmobar.hs" 
  xmonad $ defaults {
      logHook = dynamicLogWithPP $ xmobarPP {
        ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor "#FFB6B0" "" . shorten 100
      , ppCurrent = xmobarColor "#BEBEBE" ""
      }
      , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
      --, modMask = mod4Mask
      , manageHook = manageDocks <+> myManageHook
      , startupHook = setWMName "LG3D"
  }
