#!/bin/bash
#
# This is a small script that switches (most) applications to use light/dark themes.
# The switch is implemented per tool, so even if we're interrupted or if some parts fail
# we can still continue and detect the correct destination for the rest.

set -euo pipefail

WAYBAR_STYLE_CSS="$HOME/.config/waybar/style.css"

waybar_change_color() {
    local color_key="$1"
    local color_val="$2"
    sed -i "s/^@define-color\s*${color_key}\s.*/@define-color ${color_key} ${color_val};/g" \
        "${WAYBAR_STYLE_CSS}"
}

waybar_reload() {
    killall -SIGUSR2 waybar
}

waybar_darken() {
    echo "-- waybar: let there be darkness"
    waybar_change_color main_bg '#0a0c10'
    waybar_change_color main_fg '#ffffff'
    waybar_change_color text_fg '#ffffff'
    waybar_reload
}

waybar_lighten() {
    echo "-- waybar: let there be light"
    waybar_change_color main_bg '#ffffff'
    waybar_change_color main_fg '#000000'
    waybar_change_color text_fg '#000000'
    waybar_reload
}

waybar_toggle() {
    # Check if the main foreground color is white, if yes, it's dark.
    if grep -q '@define-color\smain_fg\s#000' "${WAYBAR_STYLE_CSS}"; then
        echo "-- waybar: is currently light"
        waybar_darken
    else
        echo "-- waybar: is currently dark"
        waybar_lighten
    fi
}

###########

KITTY_LIGHT_THEME='GitHub Light High Contrast'
KITTY_DARK_THEME='GitHub Dark High Contrast'
KITTY_THEME_CONF="$HOME/.config/kitty/current-theme.conf"

kitty_change_theme() {
    echo "-- kitty: switching theme to ${1}"
    kitten theme --reload-in=all "${1}"
}

kitty_toggle() {
    local current_theme
    current_theme="$(grep 'name:' "${KITTY_THEME_CONF}" | cut -d: -f2 | xargs)"
    echo "-- kitty: current theme is »${current_theme}«"

    if [ "${current_theme}" = "${KITTY_DARK_THEME}" ]; then
        kitty_change_theme "${KITTY_LIGHT_THEME}"
    else
        kitty_change_theme "${KITTY_DARK_THEME}"
    fi
}

###########

GTK_THEME_DARK="Adwaita-dark"
GTK_THEME_LIGHT="HighContrast"

gtk_toggle() {
    # I almost don't use any GTK applications, but this is mainly to make firefox
    # use the correct theme. It also reloads instantly.

    local current_theme
    current_theme="$(gsettings get org.gnome.desktop.interface gtk-theme | tr -d "'")"

    echo "-- gtk: current theme is ${current_theme}"
    if [ "${current_theme}" = "${GTK_THEME_DARK}" ]; then
        echo "-- gtk: switching to ${GTK_THEME_LIGHT}"
        gsettings set org.gnome.desktop.interface gtk-theme "${GTK_THEME_LIGHT}"
    else
        echo "-- gtk: switching to ${GTK_THEME_DARK}"
        gsettings set org.gnome.desktop.interface gtk-theme "${GTK_THEME_DARK}"
    fi
}

###########

NVIM_COLORSAVER="$HOME/.local/share/nvim/colorsaver"
NVIM_THEME_DARK="github_dark_high_contrast"
NVIM_THEME_LIGHT="github_light"

nvim_toggle() {
    # I use a nice nvim-plugin that saves the last used colorschemer in $NVIM_COLORSAVER.
    # It also watches this file via inotify and applies it. This can be therefore used
    # to easily change the theme live, also for already running instances.

    local current_theme
    current_theme="$(cat "$NVIM_COLORSAVER" || true)"

    echo "-- nvim: current theme is ${current_theme}"
    if [ "${current_theme}" = "${NVIM_THEME_DARK}" ]; then
        echo "-- nvim: switching to ${NVIM_THEME_LIGHT}"
        echo "${NVIM_THEME_LIGHT}" > "${NVIM_COLORSAVER}"
    else
        echo "-- nvim: switching to ${NVIM_THEME_DARK}"
        echo "${NVIM_THEME_DARK}" > "${NVIM_COLORSAVER}"
    fi
}

###########

nvim_toggle
kitty_toggle
waybar_toggle
gtk_toggle
