#!/usr/bin/env bash

CONFIG="$HOME/.config/kitty/kitty.conf"

if [ "$1" == "--float" ]; then
  PARAMS=$(echo ${@} | awk '{gsub(/--float/, ""); print}')
  kitty --class 'kitty-float' --config "$CONFIG" ${PARAMS}
elif [ "$1" == "--full" ]; then
  PARAMS=$(echo ${@} | awk '{gsub(/--full/, ""); print}')
  kitty --class 'kitty-fullscreen' --config "$CONFIG" \
    --start-as fullscreen \
    --override 'window_padding_width=30' \
    --override 'font_size=12' \
    --override 'background_opacity=0.95' ${PARAMS}
else
  kitty --config "$CONFIG" ${@}
fi
