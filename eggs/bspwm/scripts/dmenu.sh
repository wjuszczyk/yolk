#!/bin/sh
TERMINAL="kitty.sh"
cmd=$(dmenu_path | dmenu -i -p "Run:")
[ -z "$cmd" ] && exit 0

# If the command is a GUI app (has .desktop file), run directly
if command -v "$cmd" >/dev/null 2>&1 &&
  grep -q "Exec=$cmd" /usr/share/applications/*.desktop 2>/dev/null; then
  setsid "$cmd" &
else
  $TERMINAL -e sh -c "$cmd" &
fi
