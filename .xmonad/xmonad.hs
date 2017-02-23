-- vim: sw=4 ts=4 sts=4 et

import System.Exit
import Data.List

import XMonad
import XMonad.Operations

import XMonad.Actions.Navigation2D

import XMonad.Config.Desktop

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog

import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.IndependentScreens

import XMonad.Util.Run
import XMonad.Util.NamedScratchpad

import System.IO
import qualified Data.Map        as M
import qualified XMonad.StackSet as W

myTerminal = "lilyterm"
myLayouts = emptyBSP ||| Tall 1 (3/100) (1/2) ||| Full
myWS = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myKeys :: XConfig t -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig { modMask = mask }) = M.fromList $
    [ (( mask                 , xK_Return    ), spawn "lilyterm")
    , (( mask                 , xK_comma     ), sendMessage (IncMasterN ( 1)))
    , (( mask                 , xK_period    ), sendMessage (IncMasterN (-1)))
    , (( mask                 , xK_b         ), sendMessage ToggleStruts)
    , (( mask                 , xK_q         ), spawn "pkill xmobar; xmonad --restart")
    , (( mod4Mask             , xK_l         ), spawn "i3lock -B 3 && xset dpms force off")
    , (( mod4Mask             , xK_x         ), namedScratchpadAction scratchpads "TiS")
    , (( mask                 , xK_d         ), spawn "dmenu_run -fn 'monospace:size=10' -h 25 -w 300 -y 25 -o 0.9 -l 10") ]
    ++ -- Navigation2D
    [ (( mask                 , xK_h         ), windowGo L True)
    , (( mask                 , xK_j         ), windowGo D True)
    , (( mask                 , xK_k         ), windowGo U True)
    , (( mask                 , xK_l         ), windowGo R True)
    , (( mask .|. shiftMask   , xK_h         ), windowSwap L True)
    , (( mask .|. shiftMask   , xK_j         ), windowSwap D True)
    , (( mask .|. shiftMask   , xK_k         ), windowSwap U True)
    , (( mask .|. shiftMask   , xK_l         ), windowSwap R True) ]
    ++ -- BinarySpacePartition
    [ (( mask .|. controlMask , xK_l         ), sendMessage $ ExpandTowards R)
    , (( mask .|. controlMask , xK_h         ), sendMessage $ ExpandTowards L)
    , (( mask .|. controlMask , xK_j         ), sendMessage $ ExpandTowards D)
    , (( mask .|. controlMask , xK_k         ), sendMessage $ ExpandTowards U)
    , (( mask                 , xK_r         ), sendMessage Rotate)
    , (( mask                 , xK_s         ), sendMessage Swap)
    , (( mask                 , xK_n         ), sendMessage FocusParent)
    , (( mask .|. controlMask , xK_n         ), sendMessage SelectNode)
    , (( mask .|. shiftMask   , xK_n         ), sendMessage MoveNode) ]
    ++ -- Switch workspace
    [ (( m .|. mask           , k            ), windows $ onCurrentScreen f i)
        | (i, k) <- zip (workspaces' conf) [ xK_1 .. xK_9 ]
        , (f, m) <- [ (W.view, 0), (W.shift, shiftMask) ]]

myManage = composeOne $
    [ isDialog -?> doCenterFloat
    , role =? "pop-up" -?> doCenterFloat
    , role =? "bubble" -?> doCenterFloat
    , role =? "task_dialog" -?> doCenterFloat
    , role =? "Preferences" -?> doCenterFloat
    , role =? "page-info" -?> doCenterFloat
    , className =? "Ninix_main.rb" -?> doIgnore
    ] where role = stringProperty "WM_WINDOW_ROLE"

scratchpads =
    [ NS "TiS" (myTerminal ++ " -T 'TiS'") (title =? "TiS") defaultFloating
    ] where role = stringProperty "WM_WINDOW_ROLE"

wsPP = xmobarPP
    { ppOrder = \(ws:l:t:_) -> [ws]
    , ppWsSep = ""
    , ppSep = ""
    }
  where
    currentWsIndex w = case (elemIndex w myWS) of
        Nothing -> "1"
        Just n  -> show (n+1)

main :: IO ()
main = do
    nScreens <- countScreens
    spawn "nitrogen --restore"
    spawn "compton"
    h <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
    xmonad . withNavigation2DConfig def $ docks def
        { modMask  = mod1Mask
        , terminal = myTerminal
        , focusFollowsMouse = False
        , normalBorderColor = "#101010"
        , workspaces = withScreens nScreens myWS
        , layoutHook = avoidStrutsOn [U,L,D,R] (gaps [(U,5),(R,5),(L,5),(D,5)] $ spacing 5 $ myLayouts)
        , manageHook = myManage <+> manageHook def <+> namedScratchpadManageHook scratchpads
        , keys = myKeys <+> keys def
        , startupHook = ewmhDesktopsStartup
        , handleEventHook = handleEventHook def <+> fullscreenEventHook
        , logHook = dynamicLogWithPP $ wsPP { ppOutput = hPutStrLn h }
        }
