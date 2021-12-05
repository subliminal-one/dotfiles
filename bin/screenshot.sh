#!/usr/bin/env sh

DATE=$(date +"%Y%m%d-%H%M%S")
DEST="$HOME/media/screenshots"
FILE="$DEST/screenshot-$DATE.png"

case $1 in
  '-a')
    gnome-screenshot -a -f $FILE
    ;;

  '-w')
    gnome-screenshot -w -f $FILE
    ;;

  *)
    gnome-screenshot -f $FILE
    ;;
esac
