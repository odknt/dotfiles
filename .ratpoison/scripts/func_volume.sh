#!/bin/sh
bar_bg="#fcfcfc"
bar_fg="#F33C5B"
AMASTER=`amixer get Master | awk 'END{gsub(/\[|\]|%/,""); print $5}'`
ASTAT=`amixer get Master | awk 'END{gsub(/\[|\]|%/,""); print $6}'`

if [[ $ASTAT = "on" ]]; then
    PERCBAR=`echo "$AMASTER"\
        | gdbar -bg $bar_bg -fg $bar_fg -h 7 -w 60 -s o -ss 1 -sw 5 -nonl`
else
    PERCBAR=`echo 0 \
        | gdbar -bg $bar_bg -fg $bar_fg -h 7 -w 60 -s o -ss 1 -sw 5 -nonl`
fi

echo "^ca(4,amixer set Master 1%+)^ca(5,amixer set Master 1%-)$PERCBAR^ca()^ca()"
