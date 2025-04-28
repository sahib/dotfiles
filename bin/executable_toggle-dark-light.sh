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
        gsettings set org.gnome.desktop.interface color-scheme prefer-light
    else
        echo "-- gtk: switching to ${GTK_THEME_DARK}"
        gsettings set org.gnome.desktop.interface gtk-theme "${GTK_THEME_DARK}"
        gsettings set org.gnome.desktop.interface color-scheme prefer-dark
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

SWAY_THEME_LIGHT="$HOME/.config/sway/theme_light.cfg"
SWAY_THEME_DARK="$HOME/.config/sway/theme_dark.cfg"
SWAY_THEME_CURR="$HOME/.config/sway/theme_current.cfg"

sway_toggle() {
    local next_theme
    local curr_theme

    curr_theme="$(readlink "$SWAY_THEME_CURR")"
    if [ "$curr_theme" = "theme_dark.cfg" ]; then
        next_theme="${SWAY_THEME_LIGHT}"
    else
        next_theme="${SWAY_THEME_DARK}"
    fi

    # Source the colors directly from the theme file in a rather insecure way:
    eval "$(
        grep -v '^#' "${next_theme}" | \
        awk '{ print "export SWAY_" toupper(substr($2, 2)) "=" $3 } '
    )"

    # Directly modify the colors instead of reloading all of sway:
    swaymsg client.focused          "$SWAY_GREEN"   "$SWAY_GREEN"   "$SWAY_FG"  "$SWAY_GREEN"   "$SWAY_BLUE"
    swaymsg client.focused_inactive "$SWAY_BG"      "$SWAY_BG"      "$SWAY_FG"  "$SWAY_BG"      "$SWAY_BLUE"
    swaymsg client.unfocused        "$SWAY_BG"      "$SWAY_BG"      "$SWAY_FG"  "$SWAY_BG"      "$SWAY_BLUE"
    swaymsg client.urgent           "$SWAY_MAGENTA" "$SWAY_MAGENTA" "$SWAY_FG"  "$SWAY_MAGENTA" "$SWAY_BLUE"
    swaymsg client.focused          "$SWAY_GREEN"   "$SWAY_GREEN"   "$SWAY_FG"  "$SWAY_GREEN"   "$SWAY_BLUE"
    swaymsg client.focused_inactive "$SWAY_BG"      "$SWAY_BG"      "$SWAY_FG"  "$SWAY_BG"      "$SWAY_BLUE"
    swaymsg client.unfocused        "$SWAY_BG"      "$SWAY_BG"      "$SWAY_FG"  "$SWAY_BG"      "$SWAY_BLUE"
    swaymsg client.urgent           "$SWAY_MAGENTA" "$SWAY_MAGENTA" "$SWAY_FG"  "$SWAY_MAGENTA" "$SWAY_BLUE"
    swaymsg client.background       "$SWAY_FG"

    # Also exchange on disk, so next start of sway is correct too:
    rm -f "${SWAY_THEME_CURR}"
    ln -sfr "${next_theme}" "${SWAY_THEME_CURR}"
}

WALLPAPER_LIGHT="$HOME/wallpaper_light.jpg"
WALLPAPER_DARK="$HOME/wallpaper_dark.jpg"
WALLPAPER_CURR="$HOME/wallpaper.jpg"

wallpaper_toggle() {
    local next_path
    local curr_path

    curr_path="$(readlink "$WALLPAPER_CURR")"
    if [ "$curr_path" = "wallpaper_dark.jpg" ]; then
        next_path="${WALLPAPER_LIGHT}"
    else
        next_path="${WALLPAPER_DARK}"
    fi

    swaymsg output '*' bg "${next_path}" fill

    rm -f "${WALLPAPER_CURR}"
    ln -sfr "${next_path}" "${WALLPAPER_CURR}"
}


###########

nvim_toggle
kitty_toggle
waybar_toggle
gtk_toggle
sway_toggle
wallpaper_toggle
