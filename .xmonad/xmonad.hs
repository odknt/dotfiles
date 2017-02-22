-- vim: sw=2 ts=2 sts=2 et
import XMonad
import XMonad.Operations
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing

import XMonad.Actions.Navigation2D
import XMonad.Actions.CopyWindow

import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Xfce
import XMonad.Hooks.EwmhDesktops

import System.IO
import qualified Data.Map        as M
import qualified XMonad.StackSet as W

import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.IndependentScreens

myLayouts = emptyBSP ||| Tall 1 (3/100) (1/2) ||| Full
myWS = withScreens 2 ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
-- myWS = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myKeys :: XConfig t -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig { modMask = mask }) = M.fromList $
  [ (( mask                 , xK_comma  ), sendMessage (IncMasterN ( 1)))
  , (( mask                 , xK_period ), sendMessage (IncMasterN (-1)))
  , (( mask                 , xK_d      ), spawn "dmenu_run -fn 'monospace:size=10' -h 25 -w 300 -y 25 -o 0.9 -l 10") ]
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
  ++
  [ (( m .|. mask           , k         ), windows $ onCurrentScreen f i)
    | (i, k) <- zip (workspaces' conf) [ xK_1 .. xK_9 ]
    , (f, m) <- [ (W.view, 0), (W.shift, shiftMask) ]]

myManage = composeAll
  [ className =? "Ninix_main.rb" --> doIgnore ]

myConfig = ewmh $ gnomeConfig
  { terminal = "lilyterm"
  , focusFollowsMouse = False
  , normalBorderColor = "#101010"
  , workspaces = myWS
  , layoutHook = avoidStruts (spacing 5 $ gaps [(U,5),(R,5),(L,5),(D,5)] $ myLayouts)
  , manageHook = myManage
  , keys = \c -> myKeys c `M.union` keys gnomeConfig c
  }

main :: IO ()
main = do
  spawn "nitrogen --restore"
  spawn "compton"
  xmonad . withNavigation2DConfig def $
    myConfig { modMask  = mod1Mask }
