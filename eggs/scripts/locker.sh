#!/bin/sh
maim /tmp/screen_dump.png
magick /tmp/screen_dump.png -level 0%,100%,0.6 -filter Gaussian -resize 20% -define filter:sigma=1.5 -resize 500.5% -font IBM-Plex-Mono-Regular -pointsize 26 -fill white -gravity center -annotate +0+160 'Podaj hasło' /usr/share/i3lock-fancy/icons/lock.png -gravity center -composite /tmp/screen_dump.png
i3lock -i /tmp/screen_dump.png -n --inside-color=ffffff1c --ring-color=ffffff3e --line-color=ffffff00 --keyhl-color=00000080 --ringver-color=00000000 --separator-color=22222260 --insidever-color=0000001c --ringwrong-color=00000055 --insidewrong-color=0000001c --verif-color=00000000 --wrong-color=ff000000 --time-color=00000000 --date-color=00000000 --layout-color=00000000
rm -f /tmp/screen_dump.png
