#!/bin/sh
##  save jgmenu apps module output, and run with jgmenu
## by @damo March 2020

IGNORED_APPS="Electron|Czytnik poczty|Firefox|Avahi|Przeglądarka internetowa|xfce4|Ustawienia pulpitu|archcraft-about|archcraft-help|Thunar|org.xfce.filemanager|picom|org.xfce.thunar"
# apps-menu.csv is sourced by apps.csv
MENU_FILE="${HOME}/.config/jgmenu/apps-menu.csv"

# use env var to only output applications module
jgmenu_run apps | grep -E -v "$IGNORED_APPS" >"${MENU_FILE}"

# display menu
jgmenu --simple --config-file="~/.config/jgmenu/jgmenurc" --csv-file="~/.config/jgmenu/apps-menu.csv"

exit
