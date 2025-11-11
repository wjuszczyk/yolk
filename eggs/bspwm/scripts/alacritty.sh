#!/usr/bin/env bash
export MPD_HOST="$XDG_RUNTIME_DIR/socket"

if [ "$1" == "--float" ]; then
  if [ ${#@} -gt 1 ]; then
    alacritty --class 'alacritty-float,alacritty-float' ${@/--float/}
  else
    alacritty --class 'alacritty-float,alacritty-float'
  fi
elif [ "$1" == "--full" ]; then
  if [ ${#@} -gt 1 ]; then
    alacritty --class 'alacritty-fullscreen,alacritty-fullscreen' \
      -o window.startup_mode="'Fullscreen'" \
      window.padding.x=10 window.padding.y=10 \
      window.opacity=0.95 font.size=14 ${@/--full/}
  else
    alacritty --class 'alacritty-fullscreen,alacritty-fullscreen' \
      -o window.startup_mode="'Fullscreen'" \
      window.padding.x=10 window.padding.y=10 \
      window.opacity=0.95 font.size=14
  fi
else
  alacritty ${@}
fi
