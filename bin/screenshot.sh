#!/usr/bin/env sh

DATE=$(date +"%Y%m%d-%H%M%S")
DEST="$HOME/media/screenshots"
FILE="$DEST/screenshot-$DATE.jpg"

case $1 in
  '-a')
    gnome-screenshot -a -f $FILE
    #grim -g "$(slurp)" -t jpeg $FILE
    ;;

  '-w')
    gnome-screenshot -w -f $FILE
    #grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" -t jpeg $FILE
    ;;

  *)
    #grim -t jpeg $FILE
    gnome-screenshot -f $FILE
    ;;
esac
