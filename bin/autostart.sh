#!/bin/sh

sh ~/.fehbg
xmodmap ~/.xmodmaprc

# enable screen powersaving:
xfce4-power-manager
xset +dpms
xset dpms 0 0 300

nm-applet &
kupfer &
udiskie -s &

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

gocode 
catlightd &
