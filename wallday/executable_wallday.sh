#!/bin/bash

# This is a simple script that takes a directory with 24 images in it and
# sets the current image based on the day hour on all connected outputs. Will
# only work in sway and with oguri installed.

# For caching:
LAST_INDEX=

set_wallpaper_from_current_hour() {
    # Changes the wallpaper depending on the day hour.
    HOUR="$(date +%H)"

    # Will output the hour as "08", so to prevent
    # octal calculations we should strip the zero.
    # shellcheck disable=SC2001
    HOUR="$(echo "$HOUR" | sed 's/^0*//')"

    INDEX="$((HOUR % 24))"
    if [ "${LAST_INDEX}" = "${INDEX}" ]; then
        sleep 5
        return
    fi

    LAST_INDEX="${INDEX}"
    echo "-- switching: $INDEX"

    for output_name in $(swaymsg -t get_outputs | jq -r '.[] | .name'); do
        ogurictl output \
            --image "${HOME}/wallday/images/$INDEX.png"  \
            "${output_name}"

    done
}

LOCK_FILE=/tmp/.wallday.lock
if [[ -f $LOCK_FILE ]]; then
    # Still update the wallpaper:
    set_wallpaper_from_current_hour
    echo "-- already running, exiting."
    exit
else
    trap 'rm $LOCK_FILE' EXIT
    touch "$LOCK_FILE"
    chmod +644 "$LOCK_FILE"
fi

pkill oguri
oguri &

while true; do
    set_wallpaper_from_current_hour
done
