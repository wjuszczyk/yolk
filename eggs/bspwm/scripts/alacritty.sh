#!/usr/bin/env bash
export MPD_HOST="$XDG_RUNTIME_DIR/socket"

CONFIG="$HOME/.config/alacritty/alacritty.toml"

if [ "$1" == "--float" ]; then
  PARAMS=$(echo ${@} | awk '{gsub(/--float/, ""); print}')
  echo $PARAMS
  if [ ${#PARAMS} -gt 0 ]; then
    alacritty --class 'alacritty-float,alacritty-float' --config-file "$CONFIG" -e "${PARAMS}"
  else
    echo alacritty --class 'alacritty-float,alacritty-float' --config-file "$CONFIG"
  fi
elif [ "$1" == "--full" ]; then
  PARAMS=$(echo ${@} | awk '{gsub(/--full/, ""); print}')
  if [ ${#PARAMS} -gt 0 ]; then
    alacritty --class 'alacritty-fullscreen,alacritty-fullscreen' --config-file "$CONFIG" \
      -o window.startup_mode="'Fullscreen'" \
      window.padding.x=10 window.padding.y=10 \
      window.opacity=0.95 font.size=14 -e ${PARAMS}
  else
    alacritty --class 'alacritty-fullscreen,alacritty-fullscreen' --config-file "$CONFIG" \
      -o window.startup_mode="'Fullscreen'" \
      window.padding.x=10 window.padding.y=10 \
      window.opacity=0.95 font.size=14
  fi
else
  alacritty --config-file "$CONFIG" ${@}
fi
