#!/bin/sh

RED="\x1b[31m"
GREEN="\x1b[32m"
YELLOW="\x1b[33m"
MAGENTA="\x1b[35m"
CYAN="\x1b[36m"
RESET="\x1b[0m"

COUNTER=0

function print_progress() {
    COUNTER=$[$COUNTER +1]
    printf "${MAGENTA}[${RED}%d${YELLOW}/${GREEN}3${MAGENTA}]${RESET} %s ${CYAN}(%s)${RESET}..." $COUNTER "$1" "$2"
    $2 2>/dev/null || exit 1
    echo -e "${GREEN}done.${RESET}"
    sleep 0.1
}

print_progress "Fetching email" "mbsync --quiet --all"
print_progress "Indexing new mails" "notmuch new --quiet"
print_progress "Re-tagging new mails" "afew --tag --new"

UNREAD=$(notmuch search tag:unread | wc -l)
printf "\n${YELLOW}=>${GREEN} %d${RESET} unread mails.\n" $UNREAD
catlightctl $(printf 'flash{0.25s|{255,0,255}|%d}' $UNREAD)
