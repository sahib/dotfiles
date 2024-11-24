#!/bin/bash

# NOTE: This little program requires `playerctl`.
#       We also take advantage of the `playerctld` daemon.
#       It just tracks the status of the last used player.

PLAYER=$(playerctl --list-all | grep ncspot | head -1)
if [ -z "$PLAYER" ]; then
  PLAYER=playerctld
fi

status="$(playerctl -p "${PLAYER}" status)"
status_icon=""
case "$status" in
Playing)
  status_icon="▶"
  ;;

Paused)
  status_icon="⏸"
  ;;

Stopped)
  status_icon="◾"
  ;;

*)
  # no idea what this is.
  ;;
esac

ellipsize() {
  if [ "${#1}" -gt "$2" ]; then
    echo "${1:0:$2}…"
  fi

  echo "$1"
}

artist="$(playerctl -p "${PLAYER}" metadata artist)"
title="$(playerctl -p "${PLAYER}" metadata title)"
printf "%s %.20s - %.40s" "$status_icon" "$(ellipsize "$artist" 20)" "$(ellipsize "$title" 40)"
