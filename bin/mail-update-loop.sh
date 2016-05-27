#!/bin/sh

while true; do
    . ~/bin/mail-update.sh
    N_UNREAD=`notmuch search tag:unread | wc -l`
    if [[ $N_UNREAD -gt 0 ]]; then
        notify-send "You have ${N_UNREAD} unread mails."
    fi

    echo "-- Waiting 5 minutes --"
    sleep 5m
done
