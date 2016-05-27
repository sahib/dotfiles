#!/bin/sh

sh ~/.fehbg
xmodmap ~/.xmodmaprc

nm-applet &
kupfer &

# Make sure no other notify daemon runs:
pkill xfce4-notifyd
pkill twmnd
twmnd &

# One redshift is enough:
pkill -9 redshift
redshift &

# Periodically look for mail:
pkill mail-update-loop.sh
. ~/bin/mail-update-loop.sh
