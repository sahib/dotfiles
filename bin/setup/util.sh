#!/bin/sh

function install_package() {
    local YAOURT_LOG=`mktemp`

    echo "-- Installing: $*"
    yaourt -S --noconfirm $* 2>&1 > ${YAOURT_LOG}

    if [[ $? != 0 ]]; then 
        echo "-- yaourt failed :( - Showing log:"
        cat "${YAOURT_LOG}"
        rm "${YAOURT_LOG}"
        exit 1
    fi

    rm "${YAOURT_LOG}"
}

function symlink() {
    echo "--- Linking $1 to $2"
    mkdir -p $(dirname "$2")
    ln -s "$1" "$2"
}
