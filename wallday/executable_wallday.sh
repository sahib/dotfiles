#!/bin/bash

# This is a simple script that takes a directory with 24 images in it and
# sets the current image based on the day hour on all connected outputs. Will
# only work in sway or other wlroots window managers.

set -euo pipefail

set_wallpaper_from_current_hour() {
    # Changes the wallpaper depending on the day hour.
    # NOTE: Minutes are not counted. This is due to a quirk
    # of mpv: when starting it 14:30 he will skip to the closest
    # frame, which is 15:00. However he should wait some more.
    # We can either choose to be early or late. :(
    START="$(date +'%H:00:00')"

    for output_name in $(swaymsg -t get_outputs | jq -r '.[] | .name'); do
        # NOTE: Video scaling is here as stupid work around for my slightly differently sized screens.
        # (one could easily calculate correct scaling with highest resolution screen as reference,
        #  but I'm currently to lazy to do so.)
        mpvpaper \
            --mpv-options "--loop=inf --video-scale-x=1.1111 --video-scale-y=1.1111 --no-audio --start=${START}" \
            "${output_name}" \
            ~/wp-23h.mkv &
    done

    wait
}

LOCK_FILE=/tmp/.wallday.lock
if [[ -f $LOCK_FILE ]]; then
    # Still update the wallpaper:
    set_wallpaper_from_current_hour
    echo "-- already running, exiting."
    exit
else
    trap 'rm -f $LOCK_FILE' EXIT
    touch "$LOCK_FILE"
    chmod +644 "$LOCK_FILE"
fi

pkill swaybg || true
pkill mpvpaper || true
set_wallpaper_from_current_hour
