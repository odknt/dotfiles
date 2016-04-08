#!/bin/sh
fg="#fcfcfc"
bg="#2d2d2d"
conky -c ~/.xmonad/scripts/conky_dzen2 | dzen2 -p -ta r -e 'button3=' -fn 'Droid Sans Fallback-8' -fg "$fg" -bg "$bg" -h 24 -w 966 -x 400
